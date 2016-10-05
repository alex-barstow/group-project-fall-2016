class Cheese < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :age, allow_blank: true, format: { with: /\d+ (months?|days?|years?)\z/}
end
