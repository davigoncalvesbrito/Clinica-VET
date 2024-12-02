class SwaggerUiController < ApplicationController
    # Pular autenticação para os arquivos estáticos do Swagger UI
    # skip_before_action :authorize_request, only: [:index, :show]
    skip_before_action :authorize_request
  
    def index
      redirect_to '/swagger-ui/index.html'
    end
  
    def show
      file_path = Rails.root.join('public', 'swagger-ui', "#{params[:path]}.html")
      if File.exist?(file_path)
        render file: file_path
      else
        render file: Rails.root.join('public', 'swagger-ui', params[:path])
      end
    end
  end
  