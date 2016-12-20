class Location < ApplicationRecord
	belongs_to :restaurant

	LOCATION_CATEGORY = ["SALON", "TERRAZA", "BARRA"]

	def location_ventas
		ventas = 0
		self.commands.each do |c|
			ventas += c.command_price
		end

		return commands
	end
end
