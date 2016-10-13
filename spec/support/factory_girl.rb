require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "user_name#{n + 1}" }
    sequence(:email)      { |n| "email#{n + 1}@example.com" }
    first_name 'firstname'
    last_name 'lastname'
    avatar 'http://static1.squarespace.com/static/54c95d06e4b04d8d26f97dde/t/570d4048e707ebd28d303f32/1460486224633/'
    password 'password'
    password_confirmation 'password'
    role 'member'
  end

  factory :cheese do
    sequence(:name) { |n| "Vermont Sharp White Cheddar #{n}" }
    sequence(:description) { |n| "this is my #{n}th favorite cheese" }
    avatar 'apple.png'
    age '5 days'
    user
  end

  factory :review do
    rating 5
    sequence(:body) { |n| "this cheese is #{n}" }

    user
    cheese
  end
  factory :vote do
    trait :upvote do
      vote 1
    end
    trait :downvote do
      vote -1
    end
    user
    review
  end
end
