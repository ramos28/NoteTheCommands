class TakeawayProduct < ApplicationRecord
	belongs_to :takeaway
	belongs_to :product
end