class Cheese < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  validates :user_id, presence: true
  validates :age, allow_blank: true,
                  format: { with: /\d+ (months?|days?|years?)\z/ }

  belongs_to :user
  has_many :reviews

  def average_rating
    reviews.map(&:rating).reduce(:+) / reviews.length.to_f
  end
end
