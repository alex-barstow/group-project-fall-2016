require 'rails_helper'

feature 'user sees a list of reviewed cheeses' do
  let!(:cheese) { FactoryGirl.create(:cheese) }

  scenario 'the cheeses name is visible', js: true do
    visit root_path
    expect(page).to have_content(cheese.name)
  end

  scenario 'User sees average rating on cheese page', js: true do
    cheese = FactoryGirl.create(:cheese)
    FactoryGirl.create(:review, cheese: cheese, rating: 1)
    FactoryGirl.create(:review, cheese: cheese, rating: 2)

    visit cheeses_path
    expect(page).to have_content(cheese.formatted_rating)
  end
end
