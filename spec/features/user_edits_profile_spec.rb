require 'rails_helper'

feature 'user can edit their username, password, and avatar', %(
  As an authenticated user
  I want to be able to edit my profile
  So that I can change my personal public and private account information
) do

  scenario 'user can access their profile page' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link 'My Profile'
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.user_name)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.avatar)
    expect(page).to have_content(user.email)
  end

  scenario 'user can edit their profile information' do
    user_name = 'joel'
    first_name = 'joe'
    last_name = 'joe'
    email = 'joe@joe.com'
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit root_path
    click_link 'My Profile'
    click_link 'Edit Profile'
    fill_in 'Username', with: user_name
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Email', with: email
    expect(page).to have_content('Avatar')
    click_button 'Submit Changes'
    expect(page).to have_content(user_name)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(email)
  end

  scenario "unauthenticated user can't see edit profile on other pages" do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit user_path(user_2)
    expect(page).to_not have_content('Edit Profile')
  end

  scenario 'unauthenticated user gets redirected to sign up' do
    visit users_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
