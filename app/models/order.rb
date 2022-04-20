class Order < ApplicationRecord
	FIVE_PM_IN_JAKARTA = 8
	FOUR_AM_IN_JAKARTA = 22
	
	has_many :menus_orders
	has_many :menus, through: :menus_orders
		
	accepts_nested_attributes_for :menus_orders, allow_destroy: true
	
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validate :at_least_one_menus_order

	#Change order status from new to cancelled when load model in given range of time
	after_find do |order|
		if Time.now.hour > FIVE_PM_IN_JAKARTA && Time.now.hour < FOUR_AM_IN_JAKARTA
			if order.status == "new"
				order.status = "cancelled"
			end
		end
		order.save
  end
	
	def total
	  self.total = self.menus_orders.map { |menus_order| menus_order.sub_total }.sum
	end

	private
  def at_least_one_menus_order
    return errors.add :base, "Must have at least one Menu" unless menus_orders.length > 0
  end       
end