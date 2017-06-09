class Product < ApplicationRecord

	belongs_to :restaurant
	has_many :takeaway_products

	PRODUCT_CATEGORY = ["RACION", "CALDOS", "PESCADOS", "CARNES-ROJAS", "ENSALADAS", "BOCADILLO", "POSTRE", "BEBIDA", "BEBIDAS ALCOHOLICAS", "APERITIVO", "TACO", "BURRITO", "WRAP", "GENERAL", "EXTRAS", "VERDURAS", "POLLO"]

	#definimos una clase metodo search
  	def self.search(search)
	  	if search
	    	where('name LIKE ?', "%#{search}%")
	  	else
	    	where(nil)
	  	end
	end
end

