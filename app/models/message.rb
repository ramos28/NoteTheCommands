class Message < ApplicationRecord
	belongs_to :user

	VIEW_CATEGORY = ["NO LEIDO", "LEIDO"]
end
