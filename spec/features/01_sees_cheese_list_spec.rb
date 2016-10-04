require 'rails_helper'

feature 'user sees a list of reviewed cheeses' do
  let!(:cheese) do
    Cheese.create(
      name: 'Vermont Sharp White Cheddar',
      user_id: 1,
      age: 8,
      description: 'This cheese is dank!'
    )
  end

  scenario 'the cheeses name is visible' do
    visit '/'

    expect(page).to have_content('Vermont Sharp White Cheddar')
  end

  scenario 'the cheeses description is visible' do
    visit '/'

    expect(page).to have_content('This cheese is dank!')
  end

  # scenario "the cheese's average rating is visible" do
  #
  # end

  # scenario "the cheese's thumbnail is visible" do
  #
  # end
  
  # scenario "the cheese's are sorted by average rating, in descending order" do
  #
  # end
end
