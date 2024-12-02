class CreateVeterinarios < ActiveRecord::Migration[7.2]
  def change
    create_table :veterinarios do |t|
      t.string :nome
      t.string :email
      t.string :crmv

      t.timestamps
    end

    #Garante que os atributos e-mail e CRMV sejam únicos.
    add_index :veterinarios, :email, unique: true
    add_index :veterinarios, :crmv, unique: true

  end
end
