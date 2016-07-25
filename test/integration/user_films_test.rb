require 'test_helper'

class UserFilmsTest < ActionDispatch::IntegrationTest

  test 'user can create a film' do
    login_user

    Genre.create(name: 'Drama')

    click_link 'Create Film'
    fill_in "Title", with: "Forrest Gump"
    fill_in "Description", with: "Momma always said, 'Life's like a box of chocolates.'"
    select 'Drama', from: 'film[genre_id]'
    click_button "Submit"

    assert page.has_content?("Forrest Gump")
    assert page.has_content?("Momma always said, 'Life's like a box of chocolates.'")
  end

  test 'user can edit film' do
    login_user
    create_film

    click_link 'The Truman Show'
    click_link 'Edit'

    fill_in 'Title', with: 'The Truman Show'
    fill_in 'Description', with: "Easily Jim Carrey's best film."
    select 'Drama', from: 'film[genre_id]'
    click_button 'Submit'

    assert page.has_content? 'The Truman Show'
    assert page.has_content? "Easily Jim Carrey's best film."
  end

  test 'user can delete film' do
    login_user
    create_film

    click_link 'The Truman Show'
    click_link 'Delete'

    assert_equal films_path, current_path
    refute page.has_content? 'The Truman Show'
    refute page.has_content? 'Some description'
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
    Genre.create(name: 'Drama')
    Film.create(title: 'The Truman Show', description: 'Some description', user_id: @user.id)
    visit films_path
  end

end
