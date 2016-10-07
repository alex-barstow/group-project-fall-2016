require 'rails_helper'

feature 'user signs up', %Q{
  As a prospective user
  I want to create an account
  So that I can post items and review them
} do

  # Acceptance Criteria:
  # * I must be able to create an account by providing my email
  # * I must be able to set and verify a password
  # * I must be able to create a username connected to the account

  scenario 'user specifies valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Username', with: 'username'
    fill_in 'First name', with: 'firstname'
    fill_in 'Last name', with: 'lastname'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    expect(page).to have_content('Avatar')
    click_button 'Sign Up'
    expect(page).to have_content('Welcome to the World of Cheese')
    expect(page).to have_content('Sign Out')
  end

  scenario 'user specifies invalid information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("User name can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content('User name is too short')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'user specifies incorrect password confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Username', with: 'username'
    fill_in 'First name', with: 'firstname'
    fill_in 'Last name', with: 'lastname'
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign Up'
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content('Sign Out')
  end

end
