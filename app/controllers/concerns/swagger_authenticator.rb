module SwaggerAuthenticator
    extend ActiveSupport::Concern
  
    included do
      before_action :skip_auth_if_swagger
    end
  
    def skip_auth_if_swagger
      if request.path.start_with?('/swagger-ui') || request.path.start_with?('/api-docs')
        skip_before_action :authorize_request
      end
    end
  end
  