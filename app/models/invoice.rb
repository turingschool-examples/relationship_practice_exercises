class Invoice < ActiveRecord::Base
  belongs_to :customer
  has_many :invoice_items
  has_many :tracks, through: :invoice_items
end
