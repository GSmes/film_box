require 'test_helper'

class FilmsIndexTest < ActionDispatch::IntegrationTest

  test 'user sees films listed on index' do
    login_user
    create_film

    visit films_path
    within '.card-title' do
      assert page.has_content?("The Departed")
    end
  end

  test 'page links to new film path' do
    create_user
    create_film

    visit films_path
    click_link "Create Film"

    assert_equal new_film_path, current_path
  end

  def login_user
    @user = User.create(username: "Hodor",
                        password: "password",
                        role: 0)

    visit login_path
    fill_in "Username", with: "Hodor"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_film
    @admin.films.create(title: 'The Departed', description: 'So much death')
  end

end
