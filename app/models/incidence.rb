class Incidence < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	INCIDENCE_CATEGORY = ["MOBILIARIO", "COCINA", "BAÑO", "TERRAZA", "BARRA", "SALON", "ATENCION PERSONAL", "ELECTRICIDAD", "GENERAL"]
	PRIORITY_CATEGORY = ["MUY BAJA", "BAJA", "MEDIA", "ALTA", "MUY ALTA"]
end
