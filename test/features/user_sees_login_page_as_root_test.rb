require 'test_helper'

class UserLoginFeatureTest < ActionDispatch::IntegrationTest

  test 'user can see login feature as root' do
    visit '/'

    assert page.has_content?("Login")
  end

  test 'user clicking login redirects to film index for user' do
    User.create(username: "Hodor",
                password: "password")

    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal films_path, current_path
  end

end
