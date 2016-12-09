class Incidence < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	INCIDENCE_CATEGORY = ["MOBILIARIO", "ESTABLECIMIENTO", "ATENCION", "ELECTRONICA", "GENERAL"]
	PRIORITY_CATEGORY = ["MUY BAJA", "BAJA", "MEDIA", "ALTA", "MUY_ALTA"]
	SOLVED_CATEGORY = ["FALSE", "TRUE"]

end
