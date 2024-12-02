class TutorsController < ApplicationController
    include TutorsSwagger
    
    before_action :set_tutor, only: [:show, :update, :destroy]
  
    # GET /tutors
    def index
      @tutors = Tutor.all
      render json: @tutors
    rescue StandardError => e
      render_error("Erro ao buscar lista de tutores", e)
    end
  
    # GET /tutors/:id
    def show
      render json: @tutor
    end
  
    # POST /tutors
    def create
      @tutor = Tutor.new(tutor_params)
      if @tutor.valid?
        @tutor.save
        render json: { message: 'Tutor criado com sucesso!', tutor: @tutor }, status: :created
      else
        render json: { errors: @tutor.errors.full_messages }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render_error("Erro ao criar o tutor", e)
    end
  
    # PUT /tutors/:id
    def update
      if @tutor.update(tutor_params)
        render json: { message: 'Tutor atualizado com sucesso', tutor: @tutor }
      else
        render json: { errors: @tutor.errors.full_messages }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render_error("Erro ao atualizar o tutor", e)
    end
  
    # DELETE /tutors/:id
    def destroy
      if @tutor.destroy
        render json: { message: 'Tutor deletado com sucesso!' }, status: :ok
      else
        render json: { error: 'Falha ao deletar tutor' }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render_error("Erro ao deletar o tutor", e)
    end
  
    private
  
    # Método para buscar o tutor por ID
    def set_tutor
      @tutor = Tutor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Tutor não encontrado' }, status: :not_found
    end
  
    # Lista de parâmetros permitidos para criar e atualizar tutores
    def tutor_params
      params.require(:tutor).permit(:nome, :email, :cpf)
    end

  
    # Método de tratamento de erros para mensagens consistentes
    def render_error(message, exception)
      render json: { error: "#{message}: #{exception.message}" }, status: :internal_server_error
    end
  end
  