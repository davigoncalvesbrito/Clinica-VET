module AnimalsSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/animals' do
      operation :get do
        key :summary, 'Lista todos os animais'
        key :operationId, 'getAnimals'
        key :produces, ['application/json']
        key :tags, ['Animais']
        response 200 do
          key :description, 'Lista de animais'
          schema type: :array do
            items do
              key :'$ref', :Animal
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria um novo animal'
        key :operationId, 'createAnimal'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Animais']
        parameter name: :animal, in: :body, required: true, description: 'Dados do animal', schema: { '$ref' => '#/definitions/AnimalInput' }
        response 201 do
          key :description, 'Animal criado'
          schema do
            key :'$ref', :Animal
          end
        end
        response 422 do
          key :description, 'Erro de validação'
          schema do
            key :type, :object
            property :errors do
              key :type, :array
              items do
                key :type, :string
              end
            end
          end
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/animals/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID do animal'
      
      operation :get do
        key :summary, 'Busca um animal pelo ID'
        key :operationId, 'getAnimalById'
        key :produces, ['application/json']
        key :tags, ['Animais']
        response 200 do
          key :description, 'Detalhes do animal'
          schema do
            key :'$ref', :Animal
          end
        end
        response 404 do
          key :description, 'Animal não encontrado'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza um animal existente'
        key :operationId, 'updateAnimal'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Animais']
        parameter name: :animal, in: :body, required: true, description: 'Dados atualizados do animal', schema: { '$ref' => '#/definitions/AnimalInput' }
        response 200 do
          key :description, 'Animal atualizado'
          schema do
            key :'$ref', :Animal
          end
        end
        response 422 do
          key :description, 'Erro de validação'
          schema do
            key :type, :object
            property :errors do
              key :type, :array
              items do
                key :type, :string
              end
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :delete do
        key :summary, 'Deleta um animal'
        key :operationId, 'deleteAnimal'
        key :produces, ['application/json']
        key :tags, ['Animais']
        response 200 do
          key :description, 'Animal deletado com sucesso'
        end
        response 422 do
          key :description, 'Falha ao deletar animal'
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/tutors/{tutor_id}/animals' do
      parameter name: :tutor_id, in: :path, type: :integer, required: true, description: 'ID do tutor'
      
      operation :get do
        key :summary, 'Lista todos os animais de um tutor'
        key :operationId, 'getAnimalsByTutor'
        key :produces, ['application/json']
        key :tags, ['Animais']
        response 200 do
          key :description, 'Animais do tutor'
          schema type: :array do
            items do
              key :'$ref', :Animal
            end
          end
        end
        response 404 do
          key :description, 'Nenhum animal encontrado para este tutor'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo Animal
    swagger_schema :Animal do
      key :required, [:id, :nome, :sexo, :especie, :raca, :tutor_id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :nome do
        key :type, :string
      end
      property :sexo do
        key :type, :string
      end
      property :especie do
        key :type, :string
      end
      property :raca do
        key :type, :string
      end
      property :tutor_id do
        key :type, :integer
        key :format, :int64
      end
    end

    # Definição do input para criar ou atualizar animais
    swagger_schema :AnimalInput do
      key :required, [:nome, :sexo, :especie, :raca, :tutor_id]
      property :nome do
        key :type, :string
      end
      property :sexo do
        key :type, :string
      end
      property :especie do
        key :type, :string
      end
      property :raca do
        key :type, :string
      end
      property :tutor_id do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
