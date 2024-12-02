class SessoesController < ApplicationController
  include SessoesSwagger

  # Usa credentials para acessar a chave secreta
  SECRET_KEY = Rails.application.credentials.secret_key_base || 'chave_secreta'
   
  # Pular autenticação apenas para a ação `create`
  skip_before_action :authorize_request, only: [:create]

  # POST /sessoes
  def create
    veterinario = Veterinario.find_by(email: params[:email])

    if veterinario && veterinario.crmv == params[:crmv]
      token = encode_token({ veterinario_id: veterinario.id })
      render json: { message: 'Login realizado com sucesso', token: token }, status: :ok
    else
      render json: { error: 'Email ou CRMV inválidos' }, status: :unauthorized
    end
  end

  # DELETE /sessoes
  def destroy
    render json: { message: 'Logout realizado com sucesso' }, status: :ok
  end

  private

  # Método para codificar o token JWT
  def encode_token(payload)
    payload[:iat] = Time.now.to_i                # Adiciona o timestamp de criação
    payload[:exp] = 1.hour.from_now.to_i        # Define a expiração para 1 hora
    JWT.encode(payload, SECRET_KEY)
  end
end
