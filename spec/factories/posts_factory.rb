FactoryBot.define do
  factory :post do
    title { 'Sample Title' }
    content { 'This is sample content' }
    association :author, factory: :user
  end
end
