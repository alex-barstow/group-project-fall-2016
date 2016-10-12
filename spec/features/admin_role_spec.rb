require 'rails_helper'

feature 'Admin users have special privileges' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:review) { FactoryGirl.create(:review) }

  scenario 'Admin sees full user list' do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit users_path
    
    expect(page).to have_current_path(users_path)
    expect(page).to have_content(user.user_name)
    expect(page).to have_content(admin.user_name)
  end

  scenario 'Members can not access user list' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign In'
    visit users_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Insufficient access rights')
  end

  scenario 'Admin visits user show page from users list' do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit users_path
    click_link(user.user_name)

    expect(page).to have_current_path(user_path(user))
  end

  scenario 'Admin deletes a review' do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'Sign In'
    visit cheese_path(review.cheese)
    review_body = review.body
    click_link 'X'

    expect(page).to have_content('Review deleted')
    expect(page).to_not have_content(review_body)
  end

  scenario 'user can only see delete button for their own reviews' do
    visit new_user_session_path
    fill_in 'Email', with: review.user.email
    fill_in 'user_password', with: review.user.password
    click_button 'Sign In'
    visit cheese_path(review.cheese)

    expect(page).to have_link('X')

    new_review = FactoryGirl.create(:review)
    visit cheese_path(new_review.cheese)

    expect(page).to_not have_link('X')
  end

end
