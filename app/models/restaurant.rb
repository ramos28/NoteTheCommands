class Restaurant < ApplicationRecord
	has_many :restaurant_users
	has_many :users, through: :restaurant_users
	has_many :products
	has_many :questionnaires
	has_many :votations
	has_many :incidences
	has_many :messages
	has_many :blogs
	has_many :reservations
	has_many :takeaways
	has_many :locations
	has_many :menus
	has_many :commands
end
