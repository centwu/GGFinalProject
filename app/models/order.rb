class Order < ApplicationRecord
	has_many :menus_orders
	has_many :menus, through: :menus_orders

	accepts_nested_attributes_for :menus_orders, allow_destroy: true

	def subtotals  
	   self.menus_orders.map { |i| i.sub_total }  
	end  

	def total_all  
	   subtotals.sum  
	end
end
