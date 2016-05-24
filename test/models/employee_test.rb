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

  test "employee can be assigned a postal code" do
    zip = PostalCode.create(zipcode: "80205")
    employee = Employee.create(postal_code: zip)

    assert_equal "80205", employee.postal_code.zipcode
  end

  test "employee can be assigned a manager to report to" do
    manager = Employee.create(first_name: "Boss", last_name: "Sauce")

    employee = Employee.create(first_name: "Pawny", last_name: "Indy", reports_to: manager)

    assert_equal "Boss", employee.reports_to.first_name
    assert_equal "Sauce", employee.reports_to.last_name
  end

  test "An employee can be assigned subordinate employees" do
    manager = Employee.create(first_name: "Wig", last_name: "Biggy")

    manager.subordinates << [
      Employee.create(first_name: "Leon"),
      Employee.create(first_name: "Omar"),
      Employee.create(first_name: "Kara")
    ]

    assert_equal 3, manager.subordinates.count
    assert_equal "Leon", manager.subordinates.first.first_name
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
