class RestaurantsController < ApplicationController

  	def index
  		@restaurants = Restaurant.all
  		@restaurant = Restaurant.new
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			flash[:notice] = "Successfully created restaurant."
			redirect_to @restaurant
		else
			render :action =>'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
	    @restaurant = Restaurant.find(params[:id])
	    if @restaurant.update_attributes(restaurant_params)
	      	flash[:notice] = "Successfully updated restaurant."
	      	redirect_to @restaurant
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
    	@restaurant = Restaurant.find(params[:id])
    	@restaurant.destroy
    	flash[:notice] = "Successfully destroyed restaurant."
    	redirect_to restaurants_url
  	end

  	def select
  		current_user.update(current_user_restaurant: params[:restaurant_id])
  		redirect_to new_location_path
  	end
  
  	private

  	def restaurant_params
  		params.require(:restaurant).permit(:name, :phone, :address, :postal_code, :city, :country, :email)
  	end

end


