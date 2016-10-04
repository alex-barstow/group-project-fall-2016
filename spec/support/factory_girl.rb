require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "user_name#{n + 1}" }
    sequence(:email)      { |n| "email#{n + 1}@example.com" }
    first_name 'firstname'
    last_name 'lastname'
    password 'password'
    password_confirmation 'password'
  end

  factory :cheese do
    sequence(:name) { |n| "Vermont Sharp White Cheddar #{n}" }
    sequence(:description) { |n| "this is my #{n}th favorite cheese" }
    sequence(:age) { |n| n }
    sequence(:user_id) { |n| n }
  end
end
