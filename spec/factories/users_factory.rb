FactoryBot.define do
  factory :user do
    name { 'JohnDoe' }
    bio { 'This is my bio' }
    post_counter { 0 }
  end
end
