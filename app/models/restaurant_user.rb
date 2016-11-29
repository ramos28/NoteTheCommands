class RestaurantUser < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant

	ROLES = ["CLIENTE", "CAMARERO", "COCINERO", "GERENTE"]
end
