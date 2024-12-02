class InternamentosController < ApplicationController
  include InternamentosSwagger

  before_action :set_internamento, only: [:show, :update, :destroy]

  # GET /internamentos
  def index
    @internamentos = Internamento.all
    render json: @internamentos
  rescue StandardError => e
    render_error("Erro ao buscar lista de internamentos", e)
  end

  # GET /internamentos/:id
  def show
    render json: @internamento
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Internamento não encontrado" }, status: :not_found
  end

  # POST /internamentos
  def create
    @internamento = Internamento.new(internamento_params)
    if @internamento.save
      render json: { message: 'Internamento criado com sucesso!', internamento: @internamento }, status: :created
    else
      render json: { errors: @internamento.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao criar o internamento", e)
  end

  # PUT /internamentos/:id
  def update
    if @internamento.update(internamento_params)
      render json: { message: 'Internamento atualizado com sucesso!', internamento: @internamento }
    else
      render json: { errors: @internamento.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao atualizar o internamento", e)
  end

  # DELETE /internamentos/:id
  def destroy
    if @internamento.destroy
      render json: { message: 'Internamento deletado com sucesso!' }, status: :ok
    else
      render json: { error: 'Falha ao deletar o internamento' }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao deletar o internamento", e)
  end

  # GET /animals/:animal_id/internamentos
  def by_animal
    @internamentos = Internamento.where(animal_id: params[:animal_id])
    render json: @internamentos
  rescue StandardError => e
    render_error("Erro ao buscar internamentos para o animal", e)
  end

  private

  def set_internamento
    @internamento = Internamento.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Internamento não encontrado' }, status: :not_found
  end

  def internamento_params
    params.require(:internamento).permit(:data_inicio, :data_fim, :observacoes, :animal_id, :veterinario_id)
  end

  def render_error(message, exception)
    render json: { error: "#{message}: #{exception.message}" }, status: :internal_server_error
  end
end
