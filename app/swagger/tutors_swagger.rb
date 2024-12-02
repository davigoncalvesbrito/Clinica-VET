module TutorsSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/tutors' do
      operation :get do
        key :summary, 'Lista todos os tutores'
        key :operationId, 'getTutors'
        key :produces, ['application/json']
        key :tags, ['Tutores']
        response 200 do
          key :description, 'Lista de tutores'
          schema type: :array do
            items do
              key :'$ref', :Tutor
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria um novo tutor'
        key :operationId, 'createTutor'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Tutores']
        parameter name: :tutor, in: :body, required: true, description: 'Dados do tutor', schema: { '$ref' => '#/definitions/TutorInput' }
        response 201 do
          key :description, 'Tutor criado'
          schema do
            key :'$ref', :Tutor
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

    swagger_path '/tutors/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID do tutor'
      
      operation :get do
        key :summary, 'Busca um tutor pelo ID'
        key :operationId, 'getTutorById'
        key :produces, ['application/json']
        key :tags, ['Tutores']
        response 200 do
          key :description, 'Detalhes do tutor'
          schema do
            key :'$ref', :Tutor
          end
        end
        response 404 do
          key :description, 'Tutor não encontrado'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza um tutor existente'
        key :operationId, 'updateTutor'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Tutores']
        parameter name: :tutor, in: :body, required: true, description: 'Dados atualizados do tutor', schema: { '$ref' => '#/definitions/TutorInput' }
        response 200 do
          key :description, 'Tutor atualizado'
          schema do
            key :'$ref', :Tutor
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
        key :summary, 'Deleta um tutor'
        key :operationId, 'deleteTutor'
        key :produces, ['application/json']
        key :tags, ['Tutores']
        response 200 do
          key :description, 'Tutor deletado com sucesso'
        end
        response 422 do
          key :description, 'Falha ao deletar tutor'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo Tutor
    swagger_schema :Tutor do
      key :required, [:id, :nome, :email, :cpf]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :nome do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :cpf do
        key :type, :string
      end
    end

    # Definição do input para criar ou atualizar tutores
    swagger_schema :TutorInput do
      key :required, [:nome, :email, :cpf]
      property :nome do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :cpf do
        key :type, :string
      end
    end
  end
end
