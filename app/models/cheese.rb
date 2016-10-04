class Cheese < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  validates :user_id, presence: true
  validates :age, numericality: { only_integer: true }, allow_nil: true
end
