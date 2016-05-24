class Employee < ActiveRecord::Base
  belongs_to :postal_code
  has_one :reports_to, class: "Employee", as: "reports_to"
  has_many :customers
  has_many :invoices
end
