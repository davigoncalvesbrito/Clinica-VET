class Estoque < ApplicationRecord
    # Validações
    validates :nome, presence: true
    validates :quantidade, presence: true, numericality: { only_integer: true }
    validates :unidade_de_medida, presence: true
    validates :data_de_validade, presence: true
    validates :fornecedor, presence: true
    validates :preco_de_compra, presence: true, numericality: true
    validates :codigo_do_produto, presence: true, uniqueness: true
    validates :categoria, presence: true
  end
  