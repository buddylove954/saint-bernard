require 'test_helper'

class MedicationOrderTest < ActiveSupport::TestCase
  def setup
    @medication_order = MedicationOrder.create(name: "Advil", unit: "mg", dosage: 10.00, route: "IM", necessity: "very")
    @order_frequency = OrderFrequency.create(value: "1", unit: "hour")
    @medication_order.order_frequency = @order_frequency
  end

  test "medication should be able to have a check for medication_route and mass unit" do
    assert_equal @medication_order.unit, "mg"
    assert_equal @medication_order.mg?, true
    assert_equal @medication_order.route, "IM"
    assert_equal @medication_order.PO?, false
  end

  test "medication should has a relationship with a order frequency" do
    assert_equal @medication_order.order_frequency, @order_frequency
  end

end
