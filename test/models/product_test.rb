require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'is invalid without a name' do
    product = products(:coffee)
    product.name = nil
    assert !product.valid?
  end

  test 'is invalid without a price' do
    product = products(:coffee)
    product.price = nil
    assert !product.valid?
  end

  test 'is invalid with a negative price' do
    product = products(:coffee)
    product.price = -10
    assert !product.valid?
  end

  test 'is valid' do
    product = products(:coffee)
    assert product.valid?
  end
end
