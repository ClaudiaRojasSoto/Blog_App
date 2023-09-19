FactoryBot.define do
  factory :post do
    title { 'Sample Title' }
    text { 'This is sample text' }
    association :author, factory: :user
  end
end
