FactoryGirl.define do
  factory :comment do
    body "Great photo!"
    association :commentable, factory: :photo
    user
  end
end
