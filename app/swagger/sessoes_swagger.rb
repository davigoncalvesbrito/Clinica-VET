module SessoesSwagger
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/sessoes' do
        operation :post do
          key :summary, 'Autentica um veterinário'
          key :operationId, 'login'
          key :produces, ['application/json']
          key :consumes, ['application/json']
          key :tags, ['Autenticação']
          parameter name: :credentials, in: :body, required: true, description: 'Credenciais do veterinário', schema: {
            type: :object,
            properties: {
              email: { type: :string },
              crmv: { type: :string }
            },
            required: ['email', 'crmv']
          }
          response 200 do
            key :description, 'Autenticação bem-sucedida'
            schema type: :object do
              property :token do
                key :type, :string
              end
            end
          end
          response 401 do
            key :description, 'Credenciais inválidas'
          end
        end
      end
    end
  end
  