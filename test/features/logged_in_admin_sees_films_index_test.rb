require 'test_helper'

class AdminFilmIndexTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees films listed on index' do
    login_admin
    create_film

    visit films_path
    within '.film' do
      assert page.has_content?("The Departed")
    end
  end

  test 'page links to new film path' do
    login_admin
    create_film

    visit films_path
    click_link "Create Film"

    assert_equal new_film_path, current_path
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

  def create_film
    @admin.films.create(title: 'The Departed', description: 'So much death')
  end

end
