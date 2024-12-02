module ConsultasSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/consultas' do
      operation :get do
        key :summary, 'Lista todas as consultas'
        key :operationId, 'getConsultas'
        key :produces, ['application/json']
        key :tags, ['Consultas']
        response 200 do
          key :description, 'Lista de consultas'
          schema type: :array do
            items do
              key :'$ref', :Consulta
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria uma nova consulta'
        key :operationId, 'createConsulta'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Consultas']
        parameter name: :consulta, in: :body, required: true, description: 'Dados da consulta', schema: { '$ref' => '#/definitions/ConsultaInput' }
        response 201 do
          key :description, 'Consulta criada'
          schema do
            key :'$ref', :Consulta
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

    swagger_path '/consultas/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID da consulta'
      
      operation :get do
        key :summary, 'Busca uma consulta pelo ID'
        key :operationId, 'getConsultaById'
        key :produces, ['application/json']
        key :tags, ['Consultas']
        response 200 do
          key :description, 'Detalhes da consulta'
          schema do
            key :'$ref', :Consulta
          end
        end
        response 404 do
          key :description, 'Consulta não encontrada'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza uma consulta existente'
        key :operationId, 'updateConsulta'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Consultas']
        parameter name: :consulta, in: :body, required: true, description: 'Dados atualizados da consulta', schema: { '$ref' => '#/definitions/ConsultaInput' }
        response 200 do
          key :description, 'Consulta atualizada'
          schema do
            key :'$ref', :Consulta
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
        key :summary, 'Deleta uma consulta'
        key :operationId, 'deleteConsulta'
        key :produces, ['application/json']
        key :tags, ['Consultas']
        response 200 do
          key :description, 'Consulta deletada com sucesso'
        end
        response 422 do
          key :description, 'Falha ao deletar consulta'
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/consultas/veterinario/{veterinario_id}' do
      parameter name: :veterinario_id, in: :path, type: :integer, required: true, description: 'ID do veterinário'
      
      operation :get do
        key :summary, 'Lista todas as consultas de um veterinário'
        key :operationId, 'getConsultasByVeterinario'
        key :produces, ['application/json']
        key :tags, ['Consultas']
        response 200 do
          key :description, 'Consultas do veterinário'
          schema type: :array do
            items do
              key :'$ref', :Consulta
            end
          end
        end
        response 404 do
          key :description, 'Nenhuma consulta encontrada para este veterinário'
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/consultas/animal/{animal_id}' do
      parameter name: :animal_id, in: :path, type: :integer, required: true, description: 'ID do animal'
      
      operation :get do
        key :summary, 'Lista todas as consultas de um animal'
        key :operationId, 'getConsultasByAnimal'
        key :produces, ['application/json']
        key :tags, ['Consultas']
        response 200 do
          key :description, 'Consultas do animal'
          schema type: :array do
            items do
              key :'$ref', :Consulta
            end
          end
        end
        response 404 do
          key :description, 'Nenhuma consulta encontrada para este animal'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo Consulta
    swagger_schema :Consulta do
      key :required, [:id, :data_hora, :sintomas, :observacoes, :veterinario_id, :animal_id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :data_hora do
        key :type, :string
        key :format, :'date-time'
      end
      property :sintomas do
        key :type, :string
      end
      property :observacoes do
        key :type, :string
      end
      property :veterinario_id do
        key :type, :integer
        key :format, :int64
      end
      property :animal_id do
        key :type, :integer
        key :format, :int64
      end
    end

    # Definição do input para criar ou atualizar consultas
    swagger_schema :ConsultaInput do
      key :required, [:data_hora, :sintomas, :observacoes, :veterinario_id, :animal_id]
      property :data_hora do
        key :type, :string
        key :format, :'date-time'
      end
      property :sintomas do
        key :type, :string
      end
      property :observacoes do
        key :type, :string
      end
      property :veterinario_id do
        key :type, :integer
        key :format, :int64
      end
      property :animal_id do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
