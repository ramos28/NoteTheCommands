class LocationsController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@locations = Location.all
	end

	def show
		@restaurant_users = RestaurantUser.all
		@location = Location.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@location = Location.new
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			flash[:notice] = "Successfully created location."
			redirect_to @location
		else
			render :action =>'new'
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update
	    @location = Location.find(params[:id])
	    if @location.update_attributes(location_params)
	      	flash[:notice] = "Successfully updated location."
	      	redirect_to @location
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@location = Location.find(params[:id])
	    	@location.destroy
	    	flash[:notice] = "Successfully destroyed location."
	    	redirect_to locations_url
  	end
  
  	private

  	def location_params
  		params.require(:location).permit(:place, :total_price_command, :restaurant_id, :user_id)
  	end
end
