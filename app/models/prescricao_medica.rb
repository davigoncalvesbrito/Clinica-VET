class PrescricaoMedica < ApplicationRecord
    #Relacionamento
    belongs_to :consulta
    #Garante que os atributos não sejam nulos.
    validates :descricao, presence:true
end
