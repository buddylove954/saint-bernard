class CreateOrderFrequencies < ActiveRecord::Migration
  def change
    create_table :order_frequencies do |t|

      t.string :value
      t.integer :unit
    end
  end
end
