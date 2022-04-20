class MenusOrder < ApplicationRecord
	belongs_to :menu
	belongs_to :order

	validates :menu_id, presence: true
	validates :quantity, numericality: { only_integer: true, greater_than: 0}
	
	before_save :set_price, :set_subtotal
	
	def set_price
		self.price = self.menu.price
	end

	def set_subtotal
		self.sub_total = self.quantity * self.price
	end
end