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

  test "a customer has a profile" do
    customer = Customer.create(first_name: "You")
    Profile.create(password: "password", customer: customer)

    assert_equal "password", customer.profile.password
  end
end
