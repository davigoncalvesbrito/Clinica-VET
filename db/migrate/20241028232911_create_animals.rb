class CreateAnimals < ActiveRecord::Migration[7.2]
  def change
    create_table :animals do |t|
      t.string :nome
      t.string :sexo
      t.string :raca
      t.string :especie
#teste
      t.timestamps
    end
  end
end
