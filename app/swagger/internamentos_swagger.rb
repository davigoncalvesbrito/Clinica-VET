module InternamentosSwagger
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/internamentos' do
        operation :get do
          key :summary, 'Lista todos os internamentos'
          key :operationId, 'getInternamentos'
          key :produces, ['application/json']
          key :tags, ['Internamentos']
          response 200 do
            key :description, 'Lista de internamentos'
            schema type: :array do
              items do
                key :'$ref', :Internamento
              end
            end
          end
          security do
            key :Bearer, []
          end
        end
  
        operation :post do
          key :summary, 'Cria um novo internamento'
          key :operationId, 'createInternamento'
          key :produces, ['application/json']
          key :consumes, ['application/json']
          key :tags, ['Internamentos']
          parameter name: :internamento, in: :body, required: true, description: 'Dados do internamento', schema: { '$ref' => '#/definitions/InternamentoInput' }
          response 201 do
            key :description, 'Internamento criado'
            schema do
              key :'$ref', :Internamento
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
  
      swagger_path '/internamentos/{id}' do
        parameter name: :id, in: :path, type: :integer, required: true, description: 'ID do internamento'
        
        operation :get do
          key :summary, 'Busca um internamento pelo ID'
          key :operationId, 'getInternamentoById'
          key :produces, ['application/json']
          key :tags, ['Internamentos']
          response 200 do
            key :description, 'Detalhes do internamento'
            schema do
              key :'$ref', :Internamento
            end
          end
          response 404 do
            key :description, 'Internamento não encontrado'
          end
          security do
            key :Bearer, []
          end
        end
  
        operation :put do
          key :summary, 'Atualiza um internamento existente'
          key :operationId, 'updateInternamento'
          key :produces, ['application/json']
          key :consumes, ['application/json']
          key :tags, ['Internamentos']
          parameter name: :internamento, in: :body, required: true, description: 'Dados atualizados do internamento', schema: { '$ref' => '#/definitions/InternamentoInput' }
          response 200 do
            key :description, 'Internamento atualizado'
            schema do
              key :'$ref', :Internamento
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
          key :summary, 'Deleta um internamento'
          key :operationId, 'deleteInternamento'
          key :produces, ['application/json']
          key :tags, ['Internamentos']
          response 200 do
            key :description, 'Internamento deletado com sucesso'
          end
          response 422 do
            key :description, 'Falha ao deletar internamento'
          end
          security do
            key :Bearer, []
          end
        end
      end
  
      swagger_path '/animals/{animal_id}/internamentos' do
        parameter name: :animal_id, in: :path, type: :integer, required: true, description: 'ID do animal'
        
        operation :get do
          key :summary, 'Lista todos os internamentos de um animal'
          key :operationId, 'getInternamentosByAnimal'
          key :produces, ['application/json']
          key :tags, ['Internamentos']
          response 200 do
            key :description, 'Internamentos do animal'
            schema type: :array do
              items do
                key :'$ref', :Internamento
              end
            end
          end
          response 404 do
            key :description, 'Nenhum internamento encontrado para este animal'
          end
          security do
            key :Bearer, []
          end
        end
      end
  
      # Definição do modelo Internamento
      swagger_schema :Internamento do
        key :required, [:id, :data_inicio, :data_fim, :observacoes, :animal_id, :veterinario_id]
        property :id do
          key :type, :integer
          key :format, :int64
        end
        property :data_inicio do
          key :type, :string
          key :format, :'date-time'
        end
        property :data_fim do
          key :type, :string
          key :format, :'date-time'
        end
        property :observacoes do
          key :type, :string
        end
        property :animal_id do
          key :type, :integer
          key :format, :int64
        end
        property :veterinario_id do
          key :type, :integer
          key :format, :int64
        end
      end
  
      # Definição do input para criar ou atualizar internamentos
      swagger_schema :InternamentoInput do
        key :required, [:data_inicio, :data_fim, :observacoes, :animal_id, :veterinario_id]
        property :data_inicio do
          key :type, :string
          key :format, :'date-time'
        end
        property :data_fim do
          key :type, :string
          key :format, :'date-time'
        end
        property :observacoes do
          key :type, :string
        end
        property :animal_id do
          key :type, :integer
          key :format, :int64
        end
        property :veterinario_id do
          key :type, :integer
          key :format, :int64
        end
      end
    end
  end
  