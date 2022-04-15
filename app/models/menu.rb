class Menu < ApplicationRecord
	has_many :categories_menus
	has_many :categories, through: :categories_menus

	validates :name, presence: true
	validates :description, presence: true
end
