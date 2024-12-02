class ConsultasController < ApplicationController
  include ConsultasSwagger

  before_action :set_consulta, only: [:show, :update, :destroy]

  # GET /consultas
  def index
    @consultas = Consulta.all
    render json: @consultas
  rescue StandardError => e
    render_error("Erro ao buscar lista de consultas", e)
  end

  # GET /consultas/veterinario/:veterinario_id
  def by_veterinario
    @consultas = Consulta.where(veterinario_id: params[:veterinario_id])
    if @consultas.any?
      render json: @consultas, status: :ok
    else
      render json: { error: 'Nenhuma consulta encontrada para este veterinário' }, status: :not_found
    end
  rescue StandardError => e
    render_error("Erro ao buscar consultas para o veterinário", e)
  end

  # GET /consultas/animal/:animal_id
  def by_animal
    @consultas = Consulta.where(animal_id: params[:animal_id])
    if @consultas.any?
      render json: @consultas, status: :ok
    else
      render json: { error: 'Nenhuma consulta encontrada para este animal' }, status: :not_found
    end
  rescue StandardError => e
    render_error("Erro ao buscar consultas para o animal", e)
  end

  # GET /consultas/:id
  def show
    render json: @consulta
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Consulta não encontrada" }, status: :not_found
  end

  # POST /consultas
  def create
    @consulta = Consulta.new(consulta_params)
    if @consulta.save
      render json: { message: 'Consulta criada com sucesso', consulta: @consulta }, status: :created
    else
      render json: { errors: @consulta.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao criar a consulta", e)
  end

  # PUT /consultas/:id
  def update
    if @consulta.update(consulta_params)
      render json: { message: 'Consulta atualizada com sucesso!', consulta: @consulta }
    else
      render json: { errors: @consulta.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao atualizar a consulta", e)
  end

  # DELETE /consultas/:id
  def destroy
    if @consulta.destroy
      render json: { message: 'Consulta deletada com sucesso!' }, status: :ok
    else
      render json: { error: 'Falha ao deletar a consulta' }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao deletar a consulta", e)
  end

  private

  # Método para buscar a consulta por ID
  def set_consulta
    @consulta = Consulta.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Consulta não encontrada' }, status: :not_found
  end

  # Lista de parâmetros permitidos para criar e atualizar consultas
  def consulta_params
    params.require(:consulta).permit(:data_hora, :sintomas, :observacoes, :veterinario_id, :animal_id)
  end

  # Método de tratamento de erros para mensagens consistentes
  def render_error(message, exception)
    render json: { error: "#{message}: #{exception.message}" }, status: :internal_server_error
  end
end
