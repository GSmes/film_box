require 'test_helper'

class NavBarTest < ActionDispatch::IntegrationTest

  test 'user can see navbar links' do
    login_user

    within 'nav' do
      assert page.has_content?("Logout")
      assert page.has_content?("My Films")
    end
  end

  def login_user
    User.create(username: "Hodor",
                        password: "password",
                        role: 0)

    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
