class Category < ApplicationRecord
	has_many :categories_menus
	has_many :menus, through: :categories_menus
end
