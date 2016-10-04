require "rails_helper"

feature "user sees a specific listed cheese" do

  let!(:cheese) do
    Cheese.create(
      name: "Vermont Sharp White Cheddar",
      user_id: 1,
      age: 8,
      description: "This cheese is dank!"
    )
  end

  scenario "clicking link to specific cheeses show page" do
    visit '/'
    click_link(cheese.name)

    expect(current_path).to eq(cheese_path(cheese))
  end

  scenario "Looking at specific cheeses show page" do
    visit cheese_path(cheese)

    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese.age)
    expect(page).to have_content(cheese.description)
    # expect(page).to have_content(cheese.image)
    # expect(page).to have_content(cheese.avgrating)
  end
end
