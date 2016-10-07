require 'rails_helper'

feature 'user votes on a review' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user upvotes a review', js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '+'

    expect(page).to have_content('- 1 +')
  end

  scenario 'user must be logged in to vote' do
    visit root_path
    click_link review.cheese.name

    expect(page).to_not have_button("upvote#{review.id}")
    expect(page).to_not have_button("downvote#{review.id}")
  end

  scenario 'authenticated user downvotes a review', js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '-'

    expect(page).to have_content('- -1 +')
  end

  scenario 'authenticated user can cancel their vote', js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name

    click_button '-'
    expect(page).to have_content('- -1 +')

    click_button '-'
    expect(page).to have_content('- 0 +')
  end

  scenario 'authenticated user changes vote', js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '-'
    click_button '+'

    expect(page).to have_content('- 1 +')
  end
end
