require 'rails_helper'

feature 'user sees a list of reviewed cheeses' do
  let!(:cheese) { FactoryGirl.create(:cheese) }

  scenario 'the cheeses name is visible' do
    visit '/'

    expect(page).to have_content(cheese.name)
  end

  scenario 'the cheeses description is visible' do
    visit '/'

    expect(page).to have_content(cheese.description)
    expect(page).to have_css('.cheese-pic')
  end
end
