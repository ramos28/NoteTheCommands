class Takeaway < ApplicationRecord
	belongs_to :restaurant
	has_many :takeaway_product

	has_many :products, through: :takeaway_product
end
