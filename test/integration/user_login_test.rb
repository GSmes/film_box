require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  
  test 'registered user can log in' do
    login_user

    assert page.has_content? 'Welcome, Hodor'
    assert page.has_content? 'Logout'
  end

  test "unregistered user cannot login" do
    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid Login. Try Again.")
    assert page.has_content?("Login")
  end

  test "registered user cannot login with wrong password" do
    user = User.create(username: "Hodor",
                       password: "password")

    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "badpassword"
    click_button "Login"

    assert page.has_content?("Invalid Login. Try Again.")
    assert page.has_content?("Login")
  end

  test "authenticated user can logout" do
    login_user

    assert page.has_content? 'Welcome, Hodor'

    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
  end

  def login_user
    User.create(username: "Hodor",
                password: "password")

    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
