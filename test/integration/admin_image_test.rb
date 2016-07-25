require 'test_helper'

class AdminImageTest < ActionDispatch::IntegrationTest

  test 'admin_can_create_image' do
    login_admin

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_images_path
    click_link 'Add Image'
    fill_in 'Name', with: 'NewImage'
    fill_in 'Link', with: 'NewImagelink.com'
    click_button 'Create Image'

    assert_equal admin_images_path, current_path
    assert page.has_content?('NewImage')
  end

  test 'admin can edit image' do
    login_admin

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_images_path
    click_link 'Add Image'
    fill_in 'Name', with: 'Funny Picture'
    fill_in 'Link', with: 'NewImagelink.com'
    click_button 'Create Image'

    visit admin_images_path
    click_link 'Funny Picture'
    click_link 'Edit'
    fill_in 'Name', with: 'New Name'
    fill_in 'Link', with: 'New link'
    click_button 'Submit'

    assert page.has_content? 'New Name'
  end

  test 'admin can delete image' do
    login_admin

    ApplicationController.any_instance.stubs(:current_user).returns(@admin)

    visit admin_images_path
    click_link 'Add Image'
    fill_in 'Name', with: 'Funny Picture'
    fill_in 'Link', with: 'NewImagelink.com'
    click_button 'Create Image'

    visit admin_images_path
    click_link 'Funny Picture'
    click_link 'Delete'

    assert_equal admin_images_path, current_path
    refute page.has_content? 'Funny Picture'
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
