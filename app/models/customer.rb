class Customer < ActiveRecord::Base
  belongs_to :postal_code
  belongs_to :employee
end
