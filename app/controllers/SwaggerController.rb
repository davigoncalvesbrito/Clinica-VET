class SwaggerController < ApplicationController
  include Swagger::Blocks

  skip_before_action :authorize_request

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'API PETSHOP'
      key :description, 'Documentação da API PETSHOP'
      contact do
        key :name, 'Suporte'
      end
    end
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']

    security_definition :Bearer do
      key :type, :apiKey
      key :name, :Authorization
      key :in, :header
    end
  end

  SWAGGERED_CLASSES = [
    VeterinariosController,
    TutorsController,
    AnimalsController,
    ConsultasController,
    PrescricaoMedicasController,
    InternamentosController,
    EstoquesController,
    SessoesController,
    
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
