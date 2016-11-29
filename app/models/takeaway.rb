class Takeaway < ApplicationRecord
	belongs_to :product
	belongs_to :restaurant
end
