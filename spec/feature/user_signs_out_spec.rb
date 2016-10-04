require 'rails_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that no one else can post items or reviews on my behalf
} do

  # ACCEPTANCE CRITERIA:
  # * I must be able to log out of the site from any page

  scenario 'user specifies valid and required information' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Signed in successfully.')
    click_link 'Sign Out'
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content('Sign Out')
  end
end
