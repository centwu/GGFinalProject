FactoryBot.define do
  factory :order do
    email { Faker::Internet.email }
    status { }
    total { }
		menus_orders_attributes {
			
		}
  end
end
