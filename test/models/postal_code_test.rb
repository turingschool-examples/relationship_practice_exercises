require 'test_helper'

class PostalCodeTest < ActiveSupport::TestCase
  test "a postal code has a zipcode" do
    postal_code = PostalCode.create(zipcode: "80205")

    assert_equal "80205", postal_code.zipcode
  end

  test "a postal code can be associated with multiple customer " do
    customers = []
    customers.push(Customer.create(first_name: "Andrew"))
    customers.push(Customer.create(first_name: "Amanda"))

    postal_code = PostalCode.create(zipcode: "80205")

    postal_code.customers << customers

    assert_equal 2, postal_code.customers.count
    assert_equal "Andrew", postal_code.customers.first.first_name
  end

  test "a postal code can be associated with multiple employees" do
    employees = []
    employees.push(Employee.create(first_name: "Andrew"))
    employees.push(Employee.create(first_name: "Amanda"))

    postal_code = PostalCode.create(zipcode: "80205")

    postal_code.employees << employees

    assert_equal 2, postal_code.employees.count
    assert_equal "Andrew", postal_code.employees.first.first_name
  end
end
