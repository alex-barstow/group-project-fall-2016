require 'rails_helper'

feature 'user sees a specific listed cheese' do
  let!(:cheese) { FactoryGirl.create(:cheese) }

  scenario 'clicking link to specific cheeses show page', js: true do
    visit root_path
    click_link(cheese.name)

    expect(current_path).to eq(cheese_path(cheese))
  end

  scenario 'Looking at specific cheeses show page' do
    visit cheese_path(cheese)

    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese.age)
    expect(page).to have_content(cheese.description)
  end

  scenario 'Looking at specific cheeses show page with cheese image' do
    visit cheese_path(cheese)
    expect(page).to have_xpath('//img')
  end

  scenario 'User sees average rating on cheese page' do
    cheese = FactoryGirl.create(:cheese)
    FactoryGirl.create(:review, cheese: cheese, rating: 1)
    FactoryGirl.create(:review, cheese: cheese, rating: 2)

    visit cheese_path(cheese)
    expect(page).to have_content(cheese.formatted_rating)
  end
end
