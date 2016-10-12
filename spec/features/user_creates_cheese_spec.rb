require 'rails_helper'

feature 'user creates a cheese' do
  scenario 'user specifies valid and required information' do
    ActionMailer::Base.deliveries.clear

    user = FactoryGirl.create(:user)
    name = "chedder"
    description = "steve's cheese"
    age = '49 days'
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link 'New Cheese'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Age', with: age
    click_button 'Submit Cheese'
    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(age)
    expect(page).to have_content('Cheese added successfully.')
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario 'user does not specify valid and required information' do
    user = FactoryGirl.create(:user)
    age = '49'

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link 'New Cheese'
    fill_in 'Age', with: age
    click_button 'Submit Cheese'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content('Age is invalid')
  end

  scenario 'unauthenticated user does not see add cheese link'  do
    visit root_path
    expect(page).to_not have_content('New Cheese')
  end

  scenario 'unauthenticated user is redirected from add cheese page' do
    visit new_cheese_path
    expect(page).to_not have_current_path(new_cheese_path)
    expect(page).to have_content('Must be signed in to add cheese.')
  end
end
