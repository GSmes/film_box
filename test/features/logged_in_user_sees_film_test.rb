require 'test_helper'

class FilmShowTest < ActionDispatch::IntegrationTest

  test 'user can see film details on show page' do
    login_user
    create_film

    visit films_path
    click_link "The Departed"

    assert page.has_content?("The Departed")
    assert page.has_content?("So much death")
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
