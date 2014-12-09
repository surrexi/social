FactoryGirl.define do
  factory :post do
    body "Hi, friend"
    user
    association :sender, factory: :user
  end
end
