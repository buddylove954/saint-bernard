class OrderFrequency < ApplicationRecord
  has_many :medication_orders
  enum unit: [:hour]
end
