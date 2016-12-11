class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user
  	has_many :menu_product

	MENU_CATEGORY = ["LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO", "DOMINGO", "ESPECIAL", "INFANTIL"]
end
