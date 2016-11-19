class RestaurantUser < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant

	CUSTOMER = 0
	WAITER = 1
	CHEF = 2
	ADMIN = 3
end
