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
			flash[:notice] = "Successfully created product."
			redirect_to @restaurant
		else
			render :action =>'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
	    @product = Product.find(params[:id])
	    if @product.update_attributes(params[:product])
	      	flash[:notice] = "Successfully updated product."
	      	redirect_to @product
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
    	@product = Product.find(params[:id])
    	@product.destroy
    	flash[:notice] = "Successfully destroyed product."
    	redirect_to products_url
  	end
  
  	private

  	def restaurant_params
  		params.require(:restaurant).permit(:name, :phone, :address, :postal_code, :city, :country, :email)
  	end

end


