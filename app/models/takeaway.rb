class Takeaway < ApplicationRecord
	belongs_to :restaurant
	has_many :takeawayproduct
end
