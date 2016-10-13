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
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit cheese_path(cheese)

    expect(page).to have_content('Add Rating')
    expect(page).to have_content('Add Comment')
  end

  scenario %(authenticated user doesn't see form to create a review for cheeses
             they've already reviewed) do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: review.user.email
    fill_in 'user_password', with: review.user.password
    click_button 'Sign In'
    visit cheese_path(review.cheese)

    expect(page).to_not have_content('Add Rating')
    expect(page).to_not have_content('Add Comment')
  end

  scenario 'unauthenticated user does not see form to create a new review' do
    visit cheese_path(cheese)

    expect(page).to_not have_content('Add Review')
    expect(page).to_not have_content('Add Rating')
    expect(page).to_not have_content('Add Comment')
  end

  scenario 'authenticated user submits valid review by clicking button' do
    ActionMailer::Base.deliveries.clear
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit cheese_path(cheese)
    fill_in 'review_rating', with: review.rating
    fill_in 'review_body', with: review.body
    click_button 'Add Review'

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario %(authenticated user submits valid review with only a rating by
             clicking button) do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit cheese_path(cheese)
    fill_in 'review_rating', with: review.rating
    click_button 'Add Review'

    expect(page).to have_content(review.rating)
  end

  scenario 'authenticated user submits invalid review by clicking button' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit cheese_path(cheese)
    fill_in 'review_body', with: review.body
    click_button 'Add Review'

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not included in the list')
  end

  scenario 'authenticated user submits empty invalid review by clicking button' do
    visit cheese_path(cheese)
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit cheese_path(cheese)
    click_button 'Add Review'

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not included in the list')
  end
end
