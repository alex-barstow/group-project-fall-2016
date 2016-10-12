class Vote < ActiveRecord::Base
  validates :vote, numericality: { only_integer: true }, inclusion: { in: -1..1 }

  belongs_to :user
  belongs_to :review
end
