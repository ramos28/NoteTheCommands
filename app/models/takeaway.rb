class Takeaway < ApplicationRecord
	belongs_to :restaurant
	has_many :takeaway_product

	DELIVERED_CATEGORY = ["PENDIENTE", "ENTREGADO"]
end
