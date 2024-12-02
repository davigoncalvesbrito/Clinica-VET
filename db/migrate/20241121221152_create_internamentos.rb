class CreateInternamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :internamentos do |t|
      t.date :data_inicio
      t.date :data_fim
      t.text :observacoes
      t.references :animal, null: false, foreign_key: true
      t.references :veterinario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
