require 'factory_girl'

FactoryGirl.define do
  factory :cheese do
    sequence(:name) { |n| "Vermont Sharp White Cheddar #{n}" }
    sequence(:description) { |n| "this is my #{n}th favorite cheese" }
    sequence(:age) {|n| n }
    sequence(:user_id) {|n| n}
  end
end
