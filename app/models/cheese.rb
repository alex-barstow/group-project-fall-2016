class Cheese < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true
  validates :age, allow_blank: true,
                  format: { with: /\d+ (months?|days?|years?)\z/ }

  belongs_to :user
  has_many :reviews

end
