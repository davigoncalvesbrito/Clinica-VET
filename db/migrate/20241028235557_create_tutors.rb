class CreateTutors < ActiveRecord::Migration[7.2]
  def change
    create_table :tutors do |t|
      t.string :nome
      t.string :email
      t.string :cpf

      t.timestamps

   
    end
     #Garante que os atributos e-mail e CRMV sejam únicos.
     add_index :tutors, :cpf, unique: true
  end
end
