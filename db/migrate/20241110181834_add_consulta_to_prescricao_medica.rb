class AddConsultaToPrescricaoMedica < ActiveRecord::Migration[7.2]
  def change
    add_reference :prescricao_medicas, :consulta, null: false, foreign_key: true
  end
end
