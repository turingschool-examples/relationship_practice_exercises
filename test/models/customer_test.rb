require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "a customer has the appropriate attrubutes" do
    customer = Customer.new

    assert customer.respond_to?(:first_name)
    assert customer.respond_to?(:last_name)
    assert customer.respond_to?(:company)
    assert customer.respond_to?(:address)
    assert customer.respond_to?(:city)
    assert customer.respond_to?(:phone)
    assert customer.respond_to?(:fax)
    assert customer.respond_to?(:email)
  end

  test "a customer can have an employee represent them" do
    employee = Employee.create(first_name: "Sally", last_name: "Macarroni")

    customer = Customer.create(first_name: "Stan",
                               last_name: "Nats",
                               employee: employee
                               )

    assert_equal "Sally", customer.employee.first_name
    assert_equal "Macarroni", customer.employee.last_name
  end

  test "a customer can be assigned a postal code" do
    zip = PostalCode.create(zipcode: "80205")
    customer = Customer.create(postal_code: zip)

    assert_equal "80205", customer.postal_code.zipcode
  end

  test "a customer can have many different invoices" do
    customer = Customer.create(first_name: "Chal", last_name: "Lly")

    customer.invoices << [
      Invoice.create(total: "100"),
      Invoice.create(total: "50"),
      Invoice.create(total: "10")
    ]

    assert_equal 3, customer.invoices.count
    assert_equal "10", customer.invoices.last.total
  end
end
