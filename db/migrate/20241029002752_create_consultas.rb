class CreateConsultas < ActiveRecord::Migration[7.2]
  def change
    create_table :consulta do |t|
      t.datetime :data_hora
      t.string :sintomas
      t.string :observacoes

      t.timestamps
    end
  end
end
