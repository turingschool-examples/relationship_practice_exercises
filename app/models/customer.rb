class Customer < ActiveRecord::Base
  belongs_to :postal_code
  belongs_to :employee
  has_one :profile
  has_many :invoices
end
