class CreatePrescricaoMedicas < ActiveRecord::Migration[7.2]
  def change
    create_table :prescricao_medicas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
