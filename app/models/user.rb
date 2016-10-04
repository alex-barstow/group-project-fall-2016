class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
