require 'rails_helper'

feature 'user creates review', %Q{
  As an authenticated user
  I want to be able to rate a cheese on a scale from 1-5
  and optionally add a more lengthy description
  So that I can review cheeses for others to read
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:cheese) { FactoryGirl.create(:cheese) }

  scenario 'authenticated user sees button to create a new review' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    expect(page).to have_button('Add Review')
  end

  scenario 'unauthenticated user does not see button to create a new review' do
    visit cheese_path(cheese)
    expect(page).to_not have_button('Add Review')
  end

  scenario 'authenticated user creates review by clicking button' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_button 'Add Review'
    expect(current_path).to eq(new_cheese_review_path(cheese))
  end

  scenario 'authenticated user adds rating' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_button 'Add Review'
    fill_in 'Rating', with: 5

  end

  scenario 'authenticated user adds review description' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_button 'Add Review'
    fill_in 'Comment', with: 'you should buy this cheese'
  end
end
