class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|

      t.string :name
    end
  end
end
