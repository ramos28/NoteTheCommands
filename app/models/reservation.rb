class Reservation < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user
	belongs_to :menu
end
