FactoryGirl.define do
  factory :comment do
    body "Great photo!"
    commentable_id 1
    commentable_type "Photo"
    user
  end
end
