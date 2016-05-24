require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  test "the profile has attributes" do
    profile = Profile.new

    assert profile.respond_to?(:password)
    assert profile.respond_to?(:photo)
    assert profile.respond_to?(:cc_number)
  end

  test "the profile belongs to a specific custoemr" do
    customer = Customer.create(first_name: "Me")
    profile = Profile.create(password: "password", customer: customer)

    assert_equal "Me", profile.customer.first_name
  end
end
