require 'rails_helper'

feature 'Anyone can search the cheese list on the index page' do
  let!(:cheese1) {FactoryGirl.create(:cheese, name: 'Vermont Sharp')}
  let!(:cheese2) {FactoryGirl.create(:cheese, name: 'Pepper Jack')}

  scenario 'entering string into search bar narrows list to cheeses that contain that string', js: true do
    visit root_path
    fill_in 'Search', with: 'Vermont'
    click_link 'Search'

    expect(page).to have_content(cheese1.name)
    expect(page).to_not have_content(cheese2.name)
  end

  scenario 'after search, ajax request does not reload full cheese list' do
    visit root_path
    fill_in 'Search', with: 'Vermont'
    click_link 'Search'

    sleep(6)
    expect(page).to_not have_content(cheese2.name)
  end

end
