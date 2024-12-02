class CreateEstoques < ActiveRecord::Migration[7.2]
  def change
    create_table :estoques do |t|
      t.string :nome
      t.text :descricao
      t.integer :quantidade
      t.string :unidade_de_medida
      t.date :data_de_validade
      t.string :fornecedor
      t.decimal :preco_de_compra
      t.string :localizacao
      t.string :codigo_do_produto
      t.string :categoria
      t.date :data_de_entrada

      t.timestamps
    end
  end
end
