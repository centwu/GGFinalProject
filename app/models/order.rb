class Order < ApplicationRecord
	has_many :menus_orders
	has_many :menus, through: :menus_orders

	accepts_nested_attributes_for :menus_orders, allow_destroy: true
	
	def total  
	  self.menus_orders.map { |menus_order| menus_order.sub_total }.sum
	end
end
