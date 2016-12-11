class TotalRestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all.paginate(:per_page => 12, :page => params[:page])
	end
end
