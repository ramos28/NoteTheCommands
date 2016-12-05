class Product < ApplicationRecord

	belongs_to :restaurant

	PRODUCT_CATEGORY = ["BEBIDA", "RACION", "BOCADILLO", "GENERAL", "POSTRE"]

  	def self.search(search)
	  	if search
	    	where('name LIKE ?', "%#{search}%")
	  	else
	    	where(nil)
	  	end
	end
end

