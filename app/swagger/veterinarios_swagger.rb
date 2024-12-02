module VeterinariosSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/veterinarios' do
      operation :get do
        key :summary, 'Lista todos os veterinários'
        key :operationId, 'getVeterinarios'
        key :produces, ['application/json']
        key :tags, ['Veterinários']
        response 200 do
          key :description, 'Lista de veterinários'
          schema type: :array do
            items do
              key :'$ref', :Veterinario
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria um novo veterinário'
        key :operationId, 'createVeterinario'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Veterinários']
        parameter name: :veterinario, in: :body, required: true, description: 'Dados do veterinário', schema: { '$ref' => '#/definitions/VeterinarioInput' }
        response 201 do
          key :description, 'Veterinário criado'
          schema do
            key :'$ref', :Veterinario
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

    swagger_path '/veterinarios/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID do veterinário'
      
      operation :get do
        key :summary, 'Busca um veterinário pelo ID'
        key :operationId, 'getVeterinarioById'
        key :produces, ['application/json']
        key :tags, ['Veterinários']
        response 200 do
          key :description, 'Detalhes do veterinário'
          schema do
            key :'$ref', :Veterinario
          end
        end
        response 404 do
          key :description, 'Veterinário não encontrado'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza um veterinário existente'
        key :operationId, 'updateVeterinario'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Veterinários']
        parameter name: :veterinario, in: :body, required: true, description: 'Dados atualizados do veterinário', schema: { '$ref' => '#/definitions/VeterinarioInput' }
        response 200 do
          key :description, 'Veterinário atualizado'
          schema do
            key :'$ref', :Veterinario
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
        key :summary, 'Deleta um veterinário'
        key :operationId, 'deleteVeterinario'
        key :produces, ['application/json']
        key :tags, ['Veterinários']
        response 200 do
          key :description, 'Veterinário deletado com sucesso'
        end
        response 422 do
          key :description, 'Falha ao deletar veterinário'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo Veterinario
    swagger_schema :Veterinario do
      key :required, [:id, :nome, :email, :crmv]
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
      property :crmv do
        key :type, :string
      end
    end

    # Definição do input para criar ou atualizar veterinários
    swagger_schema :VeterinarioInput do
      key :required, [:nome, :email, :crmv]
      property :nome do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :crmv do
        key :type, :string
      end
    end
  end
end
