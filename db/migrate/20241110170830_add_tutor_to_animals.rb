class AddTutorToAnimals < ActiveRecord::Migration[7.2]
  def change
    add_reference :animals, :tutor, null: false, foreign_key: true
  end
end
