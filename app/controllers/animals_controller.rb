class AnimalsController < ApplicationController
    include AnimalsSwagger
    
    before_action :set_animal, only: [:show, :update, :destroy]

    # GET /animals
    def index
        @animals = Animal.all
        render json: @animals
    rescue StandardError => e
        render json: { error: "Erro ao buscar lista de animais: #{e.message}" }, status: :internal_server_error
    end

    # GET /animals/:id
    def show
        render json: @animal
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Animal não encontrado" }, status: :not_found
    end

    # GET /tutors/:tutor_id/animals
    def by_tutor
        @animals = Animal.where(tutor_id: params[:tutor_id])
        if @animals.any?
            render json: @animals, status: :ok
        else
            render json: { error: 'Nenhum animal encontrado para este tutor' }, status: :not_found
        end
    rescue StandardError => e
        render json: { error: "Erro ao buscar os animais do tutor: #{e.message}" }, status: :internal_server_error
    end

    # POST /animals
    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            render json: { message: 'Animal criado com sucesso', animal: @animal }, status: :created
        else
            render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
        end
    rescue StandardError => e
        render json: { error: "Erro ao criar o animal: #{e.message}" }, status: :internal_server_error
    end

    # PUT /animals/:id
    def update
        if @animal.update(animal_params)
            render json: { message: 'Animal atualizado com sucesso', animal: @animal }
        else
            render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Animal não encontrado" }, status: :not_found
    rescue StandardError => e
        render json: { error: "Erro ao atualizar o animal: #{e.message}" }, status: :internal_server_error
    end

    # DELETE /animals/:id
    def destroy
        if @animal.destroy
            render json: { message: 'Animal deletado com sucesso!' }, status: :ok
        else
            render json: { error: 'Falha ao deletar o animal' }, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Animal não encontrado" }, status: :not_found
    rescue StandardError => e
        render json: { error: "Erro ao deletar o animal: #{e.message}" }, status: :internal_server_error
    end

    private

    # Definir o animal para as ações show, update e destroy
    def set_animal
        @animal = Animal.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Animal não encontrado' }, status: :not_found
    end

    # Permitir apenas essa lista de parâmetros existentes
    def animal_params
        params.require(:animal).permit(:nome, :sexo, :especie, :raca, :tutor_id)
    end
end
