class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :cheese
  has_many :votes

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :user_id, presence: true
  validates :cheese_id, presence: true

  def total_votes
    self.votes.reduce(0) { |sum, vote| sum + vote.vote }
  end
end
