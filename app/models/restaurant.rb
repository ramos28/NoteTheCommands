class Restaurant < ApplicationRecord
	has_many :restaurant_users
	has_many :users, through: :restaurant_users
	has_many :products
	has_many :questionnaires
	has_many :votings
	has_many :incidences
	has_many :messages
	has_many :blogs
	has_many :reservations
	has_many :takeaways
	has_many :menus
	has_many :curriculums
	has_many :commands

	geocoded_by :full_address
	after_validation :geocode

	def full_address
		address + " " + city + " " + country + " " + postal_code.to_s
	end

	def ventas
		ventas = 0
		#locations_ids = self.locations.pluck(:id)
		#Command.where(location_id: locations_ids).each do |command|
		#	ventas += command.command_price
		#end

		return ventas
	end
end
