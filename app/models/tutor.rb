class Tutor < ApplicationRecord
        #Relacionamento
        has_many :animal
        #Garante que os atributos sejam únicos.
        validates :cpf, uniqueness: true

        #Garante que os atributos não sejam nulos.
        validates :nome, presence: true
        validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
        validates :cpf, presence: true, length: { is: 11 }, numericality: { only_integer: true }
end
