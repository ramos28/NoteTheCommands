class Command < ApplicationRecord
	belongs_to :location
	belongs_to :user
	has_many :command_menus
	has_many :command_products

	FINISH_CATEGORY = ["NO FINALIZADA", "FINALIZADA"]
	SERVED_CATEGORY = ["NO SERVIDO", "SERVIDO"]

	def command_price
		price = 0
		self.command_products.each do |cp|
			price += cp.product.unit_price * cp.quantity
		end

		self.command_menus.each do |cm|
			price += cm.menu.price * cp.quantity
		end

		return price
	end
end
