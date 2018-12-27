require 'test_helper'

class OrderFrequencyTest < ActiveSupport::TestCase
  def setup
    @order_frequency = OrderFrequency.create(value: "1", unit: "hour")
  end

  test "order_frequency should have a frequency unit that is an enum" do
    assert_equal @order_frequency.unit, "hour"
    assert_equal @order_frequency.hour?, true
  end
end
