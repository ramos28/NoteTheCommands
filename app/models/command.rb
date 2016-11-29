class Command < ApplicationRecord
	belongs_to :menu
	belongs_to :location
	belongs_to :product
end
