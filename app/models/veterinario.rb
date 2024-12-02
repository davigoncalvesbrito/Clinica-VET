class Veterinario < ApplicationRecord
    #Relacionamento
    has_many :consultas
    ##, class_name: 'Consulta'

    #Garante que os atributos sejam únicos.
    validates :email, uniqueness: true
    validates :crmv, uniqueness:true

    #Garante que os atributos não sejam nulos.
    validates :nome, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :crmv, presence:true
end
