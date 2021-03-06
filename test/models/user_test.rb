require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'is invalid without a name' do
    user = User.new
    assert !user.valid?
  end

  test 'is invalid with negative money' do
    user = users(:john)
    user.money = -10
    assert !user.valid?
  end

  test 'is invalid with non-integer money' do
    user = users(:john)
    user.money = 2.8
    assert !user.valid?
  end

  test 'is valid' do
    user = users(:john)
    user.money = 10
    assert user.valid?
  end
end
