require 'rails_helper'

RSpec.describe Order, type: :model do
	
	it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

	it 'is invalid with blank email' do
		menu1 = FactoryBot.create(:menu, price: 10)
    
		order = Order.create(email: nil, menus_orders_attributes:[menu_id: menu1.id, quantity: 2])
		
		order.valid?

		expect(order.errors[:email]).to include("can't be blank")
	end

	it 'is invalid with invalid email' do
		menu1 = FactoryBot.create(:menu, price: 10)
   
		order = Order.create(email: "gmail.com", menus_orders_attributes:[menu_id: menu1.id, quantity: 2])
		
		order.valid?

		expect(order.errors[:email]).to include("is invalid")
	end

	it 'is invalid if there is no menus_order' do
		order = Order.create(email: "test@gmail.com")

		order.valid?

		expect(order.errors[:base]).to eq(["Must have at least one Menu"])
	end

	it 'has a valid total price' do
    menu1 = FactoryBot.create(:menu, price: 10)
    menu2 = FactoryBot.create(:menu, price: 15)

		order = Order.create(email: "test@gmail.com", menus_orders_attributes: {
      1 => {
				menu_id: menu1.id,
        quantity: 3
      },
      2 => {
        menu_id: menu2.id,
        quantity: 2
      }})
		
		result = order.total

		expect(result).to eq(60)
  end
end
