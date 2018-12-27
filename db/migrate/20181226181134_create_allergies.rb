class CreateAllergies < ActiveRecord::Migration[5.1]
  def change
    create_table :allergies do |t|

      t.text :description
      t.integer :patient_id
    end
  end
end
