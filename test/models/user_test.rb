require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'user is valid' do
    user = User.new(username: 'Hodor', password: 'holddoor')

    assert user.valid?
  end

  test 'username must be unique' do
    User.create(username: 'Hodor', password: 'holddoor')
    user = User.new(username: 'Hodor', password: 'fdshjbdsf')

    refute user.valid?
  end

  test 'user must have username' do
    user = User.new(password: 'holddoor')

    refute user.valid?
  end

  test 'user must have password' do
    user = User.new(username: 'Hodor')

    refute user.valid?
  end

end
