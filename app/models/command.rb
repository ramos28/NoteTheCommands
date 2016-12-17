class Command < ApplicationRecord
	belongs_to :location
	belongs_to :user
	has_many :command_menu
	has_many :command_product

	FINISH_CATEGORY = ["NO LEIDO", "LEIDO"]
end
