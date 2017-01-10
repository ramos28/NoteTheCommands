class TotalRestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all.paginate(:per_page => 12, :page => params[:page])
		if params[:name].present?
	      	@restaurants = @restaurants.where("name LIKE ?", "%#{params[:name]}%")
	    end
	    if params[:country].present?
	      	@restaurants = @restaurants.where("name LIKE ?", "%#{params[:country]}%")
	    end
	end
end
