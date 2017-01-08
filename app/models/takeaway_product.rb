class TakeawayProduct < ApplicationRecord
	self.table_name = "products_takeaway"

	belongs_to :takeaway
	belongs_to :product
end