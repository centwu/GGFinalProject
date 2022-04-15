require 'rails_helper'

RSpec.describe Menu, type: :model do
	subject(:menu) do
    return FactoryBot.create(:menu)
  end
	
	it 'has a valid factory' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

	it 'is valid with a name and a description' do
    expect(menu).to be_valid
  end
end
