class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.text :description
      t.datetime :moment
      t.integer :admission_id
    end
  end
end
