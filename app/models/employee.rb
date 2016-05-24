class Employee < ActiveRecord::Base
  belongs_to :postal_code
  has_many :subordinates, class_name: "Employee", foreign_key: "reports_to_id"
  belongs_to :reports_to, class_name: "Employee"
  has_many :customers
end
