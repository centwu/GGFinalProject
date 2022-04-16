require 'rails_helper'

RSpec.describe Category, type: :model do
	subject(:category) { 
    FactoryBot.create(:category)
  }

	it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

	it 'is valid with a name' do
    expect(category).to be_valid
  end
end
