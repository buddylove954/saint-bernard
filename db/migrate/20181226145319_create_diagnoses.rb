class CreateDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnoses do |t|

      t.string :coding_system
      t.string :code
      t.text :description
      t.integer :patient_id
      t.integer :admission_id
    end
  end
end
