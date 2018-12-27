class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|

      t.text :description
      t.integer :patient_id
    end
  end
end
