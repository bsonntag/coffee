require 'test_helper'

class UserServiceTest < ActiveSupport::TestCase
  setup do
    @john = users(:john)
  end

  test 'UserService.all gets all users' do
    assert UserService.all.count == 2
  end

  test 'UserService.find gets a user' do
    user = UserService.find @john.id
    assert user == @john
  end

  test 'UserService.new creates an empty user' do
    user = UserService.new
    assert user.name.nil?
    assert user.new_record?
  end

  test 'UserService.create saves a new user' do
    user = UserService.create({ name: 'Jack' })
    assert user.name == 'Jack'
    assert user.persisted?
  end

  test 'UserService.update updates a user' do
    user = UserService.update(@john.id, { money: 3 })
    assert user == @john
    assert user.money == 3
    assert user.persisted?
  end

  test 'UserService.remove removes a user' do
    user = UserService.remove @john.id
    assert !user.persisted?
  end
end
