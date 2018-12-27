class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.text :description
      t.integer :admission_id
    end
  end
end
