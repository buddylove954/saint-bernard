class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.text :description
      t.datetime :moment
      t.integer :admission_id
    end
  end
end
