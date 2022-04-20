FactoryBot.define do
  factory :category do
    name { Faker::Food.ethnic_category }
  end

	factory :invalid_category, parent: :category do
		name { }
	end
end
