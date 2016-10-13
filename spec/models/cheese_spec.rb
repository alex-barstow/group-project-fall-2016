require 'rails_helper'

good_ages = ['1 day', '10 days', '1 month', '10 months', '1 year', '2 years', '', nil]
bad_ages = ['1 dad', '1', '1 day ', 'day', 'day 1']

describe Cheese do
  it { should have_valid(:name).when('Jon Jon', 'Steve') }
  it { should_not have_valid(:name).when(nil, '') }

  good_ages.each do |age|
    it { should have_valid(:age).when(age) }
  end

  bad_ages.each do |age|
    it { should_not have_valid(:age).when(age) }
  end

  it { should have_valid(:user).when(FactoryGirl.create(:user)) }

  it 'has an average rating for each cheese' do
    cheese = FactoryGirl.create(:cheese)
    FactoryGirl.create(:review, cheese: cheese, rating: 1)
    FactoryGirl.create(:review, cheese: cheese, rating: 2)


    expect(cheese.average_rating).to eq((1 + 2)/ 2.0)
  end
end
