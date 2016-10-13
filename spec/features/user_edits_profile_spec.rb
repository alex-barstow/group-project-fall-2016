require 'rails_helper'

feature 'user can edit their username, password, and avatar', %(
  As an authenticated user
  I want to be able to edit my profile
  So that I can change my personal public and private account information
) do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user can access their profile page' do
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

  scenario 'unauthorized user gets redirected to root path' do
    user_2 = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit edit_user_path(user_2)

    expect(page).to have_content('Insufficient access rights.')
  end

  scenario %(authorized user should see a list of their uploaded cheeses on
             their profile page) do
    cheese = FactoryGirl.create(:cheese, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit user_path(user)

    expect(page).to have_link(cheese.name)
  end

  scenario %(authorized user should be able to delete their created cheeses from
             their profile page) do
    cheese = FactoryGirl.create(:cheese, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit user_path(user)

    expect(page).to have_link('X')

    click_link('X')
    expect(page).to_not have_content(cheese.name)
    expect(page).to have_content('Cheese deleted')
  end

  scenario "admin can delete any user's cheese" do
    cheese = FactoryGirl.create(:cheese, user: user)
    admin = FactoryGirl.create(:user, role: 'admin')
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit user_path(user)

    expect(page).to have_link('X')

    click_link('X')
    expect(page).to_not have_content(cheese.name)
    expect(page).to have_content('Cheese deleted')
  end

  scenario "user can't delete another user's cheese" do
    FactoryGirl.create(:cheese, user: user)
    user_2 = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user_2.email
    fill_in 'user_password', with: user_2.password
    click_button 'Sign In'
    visit user_path(user)

    expect(page).to_not have_link('X')
  end
end
