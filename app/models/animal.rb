class Animal < ApplicationRecord
      # Relacionamentos existentes
      belongs_to :tutor
      has_many :consultas
      has_many :internamentos # Adicionado
    
      # Validações existentes
      validates :nome, :sexo, :especie, :raca, presence: true
    end
    