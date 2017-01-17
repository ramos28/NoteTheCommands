class Product < ApplicationRecord

	belongs_to :restaurant
	has_many :takeaway_products

	PRODUCT_CATEGORY = ["RACION", "CALDOS", "PESCADOS", "CARNES", "ENSALADAS", "BOCADILLO", "POSTRE", "BEBIDA", "BEBIDAS ALCOHOLICAS", "APERITIVO", "TACO", "BURRITO", "WRAP", "GENERAL", "EXTRAS"]

	#definimos una clase metodo search
  	def self.search(search)
	  	if search
	    	where('name LIKE ?', "%#{search}%")
	  	else
	    	where(nil)
	  	end
	end
end

