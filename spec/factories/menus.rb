FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Commerce.price }
  end

  factory :invalid_food, parent: :food do
    name { nil }
    description { nil }
    price { 10_000.0 }
  end
end