class Menu < ApplicationRecord
	has_many :categories_menus
	has_many :categories, through: :categories_menus
end
