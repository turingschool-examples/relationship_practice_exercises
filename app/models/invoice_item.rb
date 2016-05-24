class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :track
end
