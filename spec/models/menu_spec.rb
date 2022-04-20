require 'rails_helper'

RSpec.describe Menu, type: :model do
	subject(:menu) do
    return FactoryBot.create(:menu)
  end
	
	it 'has a valid factory' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

	it 'is valid with name, description, price, and category' do
    expect(menu).to be_valid
  end

	it 'is invalid without a name' do
    menu.name = nil
		
    menu.valid?
		
    expect(menu.errors[:name]).to include("can't be blank")
  end

	it 'is invalid without a blank name' do
    menu.name = ''
		
    menu.valid?
		
    expect(menu.errors[:name]).to include("can't be blank")
  end

	it 'is invalid without a description' do
    menu.description = nil
		
    menu.valid?
		
    expect(menu.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a blank description' do
    menu.description = ''
		
    menu.valid?
		
    expect(menu.errors[:description]).to include("can't be blank")
  end

	it 'is invalid with a duplicate name' do
    FactoryBot.create(:menu, name: 'Nasi Uduk')
    menu = FactoryBot.build(:menu, name: 'Nasi Uduk')

    menu.valid?

    expect(menu.errors[:name]).to include('has already been taken')
  end

	it 'is invalid with a non numeric price' do
    menu.price = '$1000'
		
    menu.valid?

    expect(menu.errors[:price]).to include('is not a number')
  end

	it 'is invalid with a price less than 0.01' do
    menu.price = 0.009
		
    menu.valid?

    expect(menu.errors[:price]).to include('must be greater than or equal to 0.01')
  end

	it 'is invalid with description more than 150 characters' do
		menu.description = "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgr"

		menu.valid?

		expect(menu.errors[:description]).to include('150 characters is the maximum allowed')
	end
end
