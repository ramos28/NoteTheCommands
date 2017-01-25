class RestaurantUser < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant

	has_many :commands

	ROLES = ["CLIENTE", "CAMARERO", "COCINERO", "GERENTE"]
end
