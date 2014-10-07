FactoryGirl.define do
  factory :photo do
    image 'test.png'
    album
    user
  end
end
