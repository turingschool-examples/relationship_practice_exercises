require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  test "a track has the appropriate attributes" do
    track = Track.new

    assert track.respond_to?(:name)
    assert track.respond_to?(:composer)
    assert track.respond_to?(:milliseconds)
  end

  test "a track is shown for many different invoice items" do
    track = Track.create(name: "Hot Track")

    track.invoice_items.create
    track.invoice_items.create

    assert_equal 2, track.invoice_items.count
  end

  test "a track is associated on many different invoices as many different invoice items" do
    track = Track.create(name: "Hot Track")

    track.invoices.create
    track.invoices.create

    assert_equal 2, track.invoice_items.count
  end
end
