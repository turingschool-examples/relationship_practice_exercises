require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "invoice items have appropriate attributes" do
    invoice_item = InvoiceItem.create

    assert invoice_item.respond_to?(:unit_price)
    assert invoice_item.respond_to?(:quantity)
  end

  test "an invoice item is associated with a track" do
    invoice_item = InvoiceItem.create
    invoice_item.track = Track.create(name: "Hot Stuff")

    assert_equal "Hot Stuff", invoice_item.track.name
  end
end
