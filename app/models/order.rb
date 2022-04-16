class Order < ApplicationRecord
	has_many :menus_orders
	has_many :menus, through: :menus_orders
end
