
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, uniqueness: true,
                        length: { minimum: 4, maximum: 16 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  # validates_presence_of :avatar
  # validates_integrity_of :avatar
  # validates_processing_of :avatar

  has_many :cheeses
  has_many :reviews
  has_many :votes

  def admin?
    role == 'admin'
  end

  def has_review_for?(cheese)
    reviews.map(&:cheese).include? cheese
  end
end
