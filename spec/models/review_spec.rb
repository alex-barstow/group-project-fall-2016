require 'rails_helper'

describe Review do
  it { should have_valid(:rating).when(1, 5) }
  it { should_not have_valid(:rating).when(nil, 0, 6) }

  it 'it calculates the vote total' do
    review = FactoryGirl.create(:review)
    FactoryGirl.create(:vote, :upvote, review: review)
    FactoryGirl.create(:vote, :upvote, review: review)
    FactoryGirl.create(:vote, :upvote, review: review)
    FactoryGirl.create(:vote, :downvote, review: review)
    expect(review.total_votes).to eq(2)
  end
end
