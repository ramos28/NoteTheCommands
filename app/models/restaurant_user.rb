class RestaurantUser < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant

	ROLES = ["CUSTOMER", "WAITER", "CHEF", "ADMIN"]
end
