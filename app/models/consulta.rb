class Consulta < ApplicationRecord
        #Relacionamento
        belongs_to :veterinario
        belongs_to :animal
        has_one :PrescricaoMedica
        #Garante que os atributos não sejam nulos.
        validates :data_hora, presence: true
        validates :sintomas, presence: true
end
