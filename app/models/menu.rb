class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	MENU_CATEGORY = ["LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO", "DOMINGO", "ESPECIAL", "INFANTIL"]
end
