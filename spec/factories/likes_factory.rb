FactoryBot.define do
  factory :like do
    association :post
    association :user
  end
end
