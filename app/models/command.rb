class Command < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	has_many :command_menus
	has_many :command_products

	scope :by_restaurant, -> (locations) {where("location_id => ?", locations)}

	FINISH_CATEGORY = ["NO FINALIZADA", "FINALIZADA"]
	SERVED_CATEGORY = ["NO SERVIDO", "SERVIDO"]

	def command_price
		price = 0
		self.command_products.each do |cp|
			price += cp.product.price * cp.quantity
		end

		self.command_menus.each do |cm|
			price += cm.menu.price * cm.quantity
		end

		return price
	end
end
