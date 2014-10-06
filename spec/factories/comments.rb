FactoryGirl.define do
  factory :comment do
    body "Great photo!"
    user
    photo
  end
end
