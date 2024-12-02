module PrescricaoMedicasSwagger
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/prescricao_medicas' do
      operation :get do
        key :summary, 'Lista todas as prescrições médicas'
        key :operationId, 'getPrescricoesMedicas'
        key :produces, ['application/json']
        key :tags, ['Prescrições Médicas']
        response 200 do
          key :description, 'Lista de prescrições médicas'
          schema type: :array do
            items do
              key :'$ref', :PrescricaoMedica
            end
          end
        end
        security do
          key :Bearer, []
        end
      end

      operation :post do
        key :summary, 'Cria uma nova prescrição médica'
        key :operationId, 'createPrescricaoMedica'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Prescrições Médicas']
        parameter name: :prescricao_medica, in: :body, required: true, description: 'Dados da prescrição médica', schema: { '$ref' => '#/definitions/PrescricaoMedicaInput' }
        response 201 do
          key :description, 'Prescrição médica criada'
          schema do
            key :'$ref', :PrescricaoMedica
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

    swagger_path '/prescricao_medicas/{id}' do
      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID da prescrição médica'
      
      operation :get do
        key :summary, 'Busca uma prescrição médica pelo ID'
        key :operationId, 'getPrescricaoMedicaById'
        key :produces, ['application/json']
        key :tags, ['Prescrições Médicas']
        response 200 do
          key :description, 'Detalhes da prescrição médica'
          schema do
            key :'$ref', :PrescricaoMedica
          end
        end
        response 404 do
          key :description, 'Prescrição médica não encontrada'
        end
        security do
          key :Bearer, []
        end
      end

      operation :put do
        key :summary, 'Atualiza uma prescrição médica existente'
        key :operationId, 'updatePrescricaoMedica'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        key :tags, ['Prescrições Médicas']
        parameter name: :prescricao_medica, in: :body, required: true, description: 'Dados atualizados da prescrição médica', schema: { '$ref' => '#/definitions/PrescricaoMedicaInput' }
        response 200 do
          key :description, 'Prescrição médica atualizada'
          schema do
            key :'$ref', :PrescricaoMedica
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
        key :summary, 'Deleta uma prescrição médica'
        key :operationId, 'deletePrescricaoMedica'
        key :produces, ['application/json']
        key :tags, ['Prescrições Médicas']
        response 200 do
          key :description, 'Prescrição médica deletada com sucesso'
        end
        response 422 do
          key :description, 'Falha ao deletar prescrição médica'
        end
        security do
          key :Bearer, []
        end
      end
    end

    swagger_path '/consultas/{consulta_id}/prescricoes' do
      parameter name: :consulta_id, in: :path, type: :integer, required: true, description: 'ID da consulta'
      
      operation :get do
        key :summary, 'Busca prescrições médicas por consulta'
        key :operationId, 'getPrescricoesByConsulta'
        key :produces, ['application/json']
        key :tags, ['Prescrições Médicas']
        response 200 do
          key :description, 'Prescrições médicas para a consulta'
          schema type: :array do
            items do
              key :'$ref', :PrescricaoMedica
            end
          end
        end
        response 404 do
          key :description, 'Nenhuma prescrição médica encontrada para esta consulta'
        end
        security do
          key :Bearer, []
        end
      end
    end

    # Definição do modelo PrescricaoMedica
    swagger_schema :PrescricaoMedica do
      key :required, [:id, :descricao, :consulta_id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :descricao do
        key :type, :string
      end
      property :consulta_id do
        key :type, :integer
        key :format, :int64
      end
    end

    # Definição do input para criar ou atualizar prescrições médicas
    swagger_schema :PrescricaoMedicaInput do
      key :required, [:descricao, :consulta_id]
      property :descricao do
        key :type, :string
      end
      property :consulta_id do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
