FactoryGirl.define do
  factory :post do
    body "Hi, friend"
    user
    sender_id 2
  end
end
