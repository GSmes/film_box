require 'test_helper'

class AdminGenreIndexTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees genres index' do
    admin = User.create(username: "Admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_genres_path
    assert page.has_content?("All Genres")
  end

  test 'logged in normal user does not see admin genre index' do
    user = User.create(username: "Hodor",
                       password: "password",
                       role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_genres_path
    refute page.has_content?("All Genres")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
