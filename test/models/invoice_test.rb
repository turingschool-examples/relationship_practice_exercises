require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "an invoice has the appropriate attributes" do
    invoice = Invoice.new

    assert invoice.respond_to?(:date)
    assert invoice.respond_to?(:total)
  end

  test "an invoice has many invoice items and can find the tracks name" do
    track1 = Track.create(name: "Track1")
    track2 = Track.create(name: "Track2")
    track3 = Track.create(name: "Track3")

    invoice = Invoice.create(total: "10")
    invoice.invoice_items.create(track: track1)
    invoice.invoice_items.create(track: track2)
    invoice.invoice_items.create(track: track3)

    assert_equal 3, invoice.invoice_items.count
    assert_equal "Track3", invoice.tracks.last.name
  end
end
