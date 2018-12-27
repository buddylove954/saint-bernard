class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|

      t.text :description
      t.text :necessity
      t.integer :patient_id
    end
  end
end
