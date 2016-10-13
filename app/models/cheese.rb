class Cheese < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  validates :user_id, presence: true
  validates :age, allow_blank: true,
                  format: { with: /\d+ (months?|days?|years?)\z/ }

  belongs_to :user
  has_many :reviews

  def average_rating
    if reviews.length > 0
      reviews.map(&:rating).reduce(:+) / reviews.length.to_f
    else
      0
    end
  end

  def formatted_rating
    rating = average_rating
    if rating != 0
      "%.1f" % rating
    else
      ""
    end
  end

  def as_json(options)
    super(methods: :formatted_rating)
  end
end
