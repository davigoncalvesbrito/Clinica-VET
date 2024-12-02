class ApplicationController < ActionController::API
  # Usa credentials em vez de secrets para obter a chave secreta
  SECRET_KEY = Rails.application.credentials.secret_key_base || 'chave_secreta'

  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = decode_token(token)
    @current_veterinario = Veterinario.find(decoded['veterinario_id'])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Acesso não autorizado' }, status: :unauthorized
  end

  private

  def decode_token(token)
    JWT.decode(token, SECRET_KEY)[0].with_indifferent_access
  end
end
