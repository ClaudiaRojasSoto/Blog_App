FactoryBot.define do
  factory :comment do
    text { 'This is a sample comment' }
    association :post
    association :author, factory: :user
  end
end
