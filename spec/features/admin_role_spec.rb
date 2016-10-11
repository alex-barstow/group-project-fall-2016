require 'rails_helper'

feature 'Admin users have special privileges' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }

  scenario 'Admin sees full user list' do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit users_path
    expect(page).to have_current_path(users_path)
    expect(page).to have_content(user.user_name)
    expect(page).to have_content(admin.user_name)
  end

  scenario 'Members can not access user list' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit users_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Insufficient access rights')
  end

  scenario 'Admin visits user show page from users list' do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit users_path
    click_link(user.user_name)
    expect(page).to have_current_path(user_path(user))
  end

  scenario 'Admin visits user show page from users list' do
  end
end
