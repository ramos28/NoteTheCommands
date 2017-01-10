class ContactsController < ApplicationController
	def index
		@restaurants = Restaurant.where("id = ?", "#{@current_restaurant.id}")
		@hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
			marker.lat restaurant.latitude
			marker.lng restaurant.longitude
			marker.infowindow "Restaurante: " + restaurant.name + ". " +restaurant.address + ", " + restaurant.city
		end
	end
end
