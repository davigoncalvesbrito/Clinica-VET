class VeterinariosController < ApplicationController
  include VeterinariosSwagger
  skip_before_action :authorize_request, only: [:create]

  before_action :set_veterinario, only: [:show, :update, :destroy]

  # GET /veterinarios
  def index
    @veterinarios = Veterinario.all
    render json: @veterinarios
  rescue StandardError => e
    render_error("Erro ao buscar lista de veterinários", e)
  end

  # GET /veterinarios/:id
  def show
    render json: @veterinario
  end

  # POST /veterinarios
  def create
    @veterinario = Veterinario.new(veterinario_params)
    if @veterinario.save
      render json: { message: 'Veterinário criado com sucesso!', veterinario: @veterinario }, status: :created
    else
      render json: { errors: @veterinario.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao criar o veterinário", e)
  end

  # PATCH/PUT /veterinarios/:id
  def update
    if @veterinario.update(veterinario_params)
      render json: { message: 'Veterinário atualizado com sucesso!', veterinario: @veterinario }
    else
      render json: { errors: @veterinario.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao atualizar o veterinário", e)
  end

  # DELETE /veterinarios/:id
  def destroy
    if @veterinario.destroy
      render json: { message: 'Veterinário deletado com sucesso!' }, status: :ok
    else
      render json: { error: 'Falha ao deletar veterinário' }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render_error("Erro ao deletar o veterinário", e)
  end

  private

  # Método para buscar o veterinário por ID
  def set_veterinario
    @veterinario = Veterinario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Veterinário não encontrado' }, status: :not_found
  end

  # Lista de parâmetros permitidos para criar e atualizar veterinários
  def veterinario_params
    params.require(:veterinario).permit(:nome, :email, :crmv)
  end

  # Método de tratamento de erros para mensagens consistentes
  def render_error(message, exception)
    render json: { error: "#{message}: #{exception.message}" }, status: :internal_server_error
  end
end
