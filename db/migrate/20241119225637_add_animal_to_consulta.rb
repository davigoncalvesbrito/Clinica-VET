class AddAnimalToConsulta < ActiveRecord::Migration[7.2]
  def change
    add_reference :consulta, :animal, null: false, foreign_key: true
  end
end
