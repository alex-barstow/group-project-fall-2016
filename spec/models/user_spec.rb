require 'rails_helper'

describe User do

  it { should have_valid(:first_name).when('Jon', 'Steve') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'George') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'users@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'urser', 'ursersr@com', 'ursers.com') }

  it { should have_valid(:user_name).when('example', 'username') }
  it { should_not have_valid(:user_name).when(nil, '') }

  it 'has an admin? method to determine user role' do
    user = FactoryGirl.create(:user)
    expect(user.admin?).to eq(false)

    user.role = 'admin'
    user.save
    expect(user.admin?).to eq(true)
  end

  it 'has a has_review_for? method to check if a cheese has been reviewed' do
    review = FactoryGirl.create(:review)
    cheese = FactoryGirl.create(:cheese)
    
    expect(review.user.has_review_for? review.cheese).to eq(true)
    expect(review.user.has_review_for? cheese).to eq(false)
  end
end
