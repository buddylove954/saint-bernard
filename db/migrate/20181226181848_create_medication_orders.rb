class CreateMedicationOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :medication_orders do |t|

      t.string :name
      t.integer :unit
      t.decimal :dosage
      t.integer :route
      t.integer :order_frequency_id
      t.text :necessity
      t.integer :patient_id
    end
  end
end
