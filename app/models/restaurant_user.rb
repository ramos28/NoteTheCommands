class RestaurantUser < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant

	CUSTOMER = 0
	WAITER = 1
	ADMIN = 2
	CHEF = 3
end
