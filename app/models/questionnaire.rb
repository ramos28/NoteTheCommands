class Questionnaire < ApplicationRecord
	belongs_to :restaurant

  	def self.search(search)
	  	if search
	    	where('restaurant.name LIKE ?', "%#{search}%")
	  	else
	    	where(nil)
	  	end
	end
end
