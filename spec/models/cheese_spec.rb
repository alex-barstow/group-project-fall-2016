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
end
