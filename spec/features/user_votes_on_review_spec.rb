require 'rails_helper'

feature 'user votes on a review' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user upvotes a review' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button 'Upvote'

    expect(review.vote_total).to eq(1)
    expect(page).to have_content(1)
  end

  scenario 'user must be logged in to vote' do

  end

  scenario 'authenticated user downvotes a review' do

  end

  scenario 'authenticated user changes vote' do

  end

  scenario 'authenticated user cannot vote twice' do

  end
end
