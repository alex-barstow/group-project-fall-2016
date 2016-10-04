require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to be able to rate a cheese on a scale from 1-5
  and optionally add a more lengthy description
  So that I can review cheeses for others to read
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:cheese) { FactoryGirl.create(:cheese) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'authenticated user sees form to create a new review' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Add Review')
    expect(page).to have_content('Add Rating')
    expect(page).to have_content('Add Comment')

  end

  scenario 'unauthenticated user does not see form to create a new review' do
    visit cheese_path(cheese)
    expect(page).to_not have_content('Add Review')
    expect(page).to_not have_content('Add Rating')
    expect(page).to_not have_content('Add Comment')
  end

  scenario 'authenticated user adds rating' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    fill_in 'Rating', with: review.rating
  end

  scenario 'authenticated user adds review description' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    fill_in 'Add Comment', with: review.body
  end

    scenario 'authenticated user submits review by clicking button' do
      visit cheese_path(cheese)
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign In'
      fill_in 'Add Rating', with: review.rating
      fill_in 'Add Comment', with: review.body
      click_button 'Add Review'
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)
    end
end
