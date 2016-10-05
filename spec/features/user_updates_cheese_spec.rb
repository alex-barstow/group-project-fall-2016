require 'rails_helper'

feature 'user updates their cheese' do
  let!(:cheese) { FactoryGirl.create(:cheese) }

  scenario 'user specifies valid and required information' do
    user = cheese.user
    name = 'chedder'
    description = "steve's cheese"
    age = '49 days'
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link cheese.name
    click_link 'Edit'
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Age', with: age
    click_button 'Submit Cheese'
    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(age)
    expect(page).to have_content('Cheese updated successfully.')
  end

  scenario 'user does not specify valid and required information' do
    age = '49'

    visit new_user_session_path
    fill_in 'Email', with: cheese.user.email
    fill_in 'user_password', with: cheese.user.password
    click_button 'Sign In'
    click_link cheese.name
    click_link 'Edit'
    fill_in 'Name', with: ' '
    fill_in 'Age', with: age
    click_button 'Submit Cheese'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content('Age is invalid')
  end

  scenario 'unauthenticated user does not see edit cheese link'  do
    visit cheese_path(cheese)
    expect(page).to_not have_content('Edit')

    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link cheese.name
    expect(page).to_not have_content('Edit')
  end

  scenario 'unauthenticated user is redirected from edit cheese page' do
    visit edit_cheese_path(cheese)
    expect(page).to_not have_current_path(edit_cheese_path(cheese))
    expect(page).to have_content("That's not your cheese!.")

    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit edit_cheese_path(cheese)
    expect(page).to_not have_current_path(edit_cheese_path(cheese))
    expect(page).to have_content("That's not your cheese!.")

  end
end
