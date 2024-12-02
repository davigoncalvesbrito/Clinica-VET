class Internamento < ApplicationRecord
  # Relacionamentos
  belongs_to :animal
  belongs_to :veterinario

  # Validações
  validates :data_inicio, presence: true
  validates :animal, presence: true
  validates :veterinario, presence: true
end
