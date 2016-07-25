require 'test_helper'

class AdminGenreTest < ActionDispatch::IntegrationTest

  test 'admin can create a genre' do
    login_admin

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_genres_path
    click_link 'Add Genre'
    fill_in 'Name', with: 'NewGenre'
    click_button 'Create Genre'

    assert_equal admin_genres_path, current_path
    assert page.has_content?('NewGenre')
  end

  test 'admin can view genre index' do
    login_admin
    Genre.create(name: 'NewGenre1')
    Genre.create(name: 'NewGenre2')

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_genres_path
    assert page.has_content? 'NewGenre1'
    assert page.has_content? 'NewGenre2'
  end

  test 'admin can edit genre' do
    login_admin

    Genre.create(name: 'NewGenre')
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_genres_path
    within '#NewGenre' do
      click_link 'Edit'
    end

    fill_in 'Name', with: 'EditedGenre'
    click_button 'Update Genre'

    assert_equal admin_genres_path, current_path
    assert page.has_content? 'EditedGenre'
  end

  test 'admin can delete genre' do
    login_admin

    Genre.create(name: 'NewGenre')
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    
    visit admin_genres_path
    within '#NewGenre' do
      click_link 'Delete'
    end

    refute page.has_content? 'NewGenre'
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
