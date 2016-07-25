require 'test_helper'

class AdminNavBarTest < ActionDispatch::IntegrationTest

  test 'admin can see admin navbar links' do
    login_admin

    within 'nav' do
      assert page.has_content?("Logout")
      assert page.has_content?("My Films")
      assert page.has_content?("Add New Image")
      assert page.has_content?("Add New Genre")
    end
  end

  def login_admin
    @admin = User.create(username: "Admin",
                         password: "password",
                         role: 1)

    visit login_path
    fill_in "Username", with: "Admin"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
