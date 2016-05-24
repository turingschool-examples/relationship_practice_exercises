require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "an invoice has the appropriate attributes" do
    invoice = Invoice.new

    assert invoice.respond_to?(:date)
    assert invoice.respond_to?(:total)
  end

  test "an invoice belongs to a customer" do
    customer = Customer.create(first_name: "Lucky")

    invoice = Invoice.create(total: "10", customer: customer)

    assert_equal "Lucky", invoice.customer.first_name
  end

end
