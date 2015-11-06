require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'date is today if created today' do
    order = orders(:one)
    assert order.date == 'today'
  end
end
