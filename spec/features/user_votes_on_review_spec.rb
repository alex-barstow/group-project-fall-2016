require 'rails_helper'

feature 'user votes on a review' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { FactoryGirl.create(:user) }

  # background do
  #   visit '/users/sign_in'
  #   fill_in 'Email', with: user.email
  #   fill_in 'user_password', with: user.password
  #   click_button 'Sign In'
  #
  # end

  scenario 'authenticated user upvotes a review', pending: true, js: true do
    # binding.pry
    visit new_user_session_path
    sleep(2)
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    sleep(2)
    # binding.pry
    visit cheese_path(review.cheese)
    # click_link review.cheese.name
    click_button '+'

    expect(review.vote_total).to eq(1)
    expect(page).to have_content(1)

  end

  scenario 'user must be logged in to vote' do
    visit root_path
    click_link review.cheese.name
    expect(page).to_not have_button("upvote#{review.id}")
    expect(page).to_not have_button("downvote#{review.id}")
  end

  scenario 'authenticated user downvotes a review', pending: true, js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '-'

    expect(review.vote_total).to eq(-1)
    expect(page).to have_content(-1)
  end

  scenario 'authenticated user cannot vote twice', pending: true, js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '-'
    click_button '-'

    expect(review.vote_total).to eq(-1)
    expect(page).to have_content(-1)
  end

  scenario 'authenticated user changes vote', pending: true, js: true do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    click_link review.cheese.name
    click_button '-'
    click_button '+'

    expect(review.vote_total).to eq(0)
    expect(page).to have_content(0)
  end
end
