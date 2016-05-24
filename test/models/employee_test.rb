require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "employee has necessary attributes" do
    employee = Employee.new

    assert employee.respond_to? :email
    assert employee.respond_to? :fax
    assert employee.respond_to? :phone
    assert employee.respond_to? :address
    assert employee.respond_to? :hire_date
    assert employee.respond_to? :birth_date
    assert employee.respond_to? :title
    assert employee.respond_to? :last_name
    assert employee.respond_to? :first_name
  end

  test "an employee can be the contact for many customers" do
    employee = Employee.create(first_name: "Chal", last_name: "Lly")

    employee.customers << [
      Customer.create(first_name: "Crisp"),
      Customer.create(first_name: "Cap'n"),
      Customer.create(first_name: "Crunch")
    ]

    assert_equal 3, employee.customers.count
    assert_equal "Crisp", employee.customers.first.first_name
  end
end
