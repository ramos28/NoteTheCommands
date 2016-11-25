class Voting < ApplicationRecord
	belongs_to :restaurant
	belongs_to :questionnaire
end
