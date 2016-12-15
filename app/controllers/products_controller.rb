class ProductsController < ApplicationController
	helper_method :sort_column, :sort_direction

  	def index
  		@restaurant_users = RestaurantUser.all
  		@products = Product.where("restaurant_id = ?", "#{@current_restaurant}").search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 7, :page => params[:page])
		@product = Product.new
	end

	def show
		@restaurant_users = RestaurantUser.all
		@product = Product.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Successfully created product."
			redirect_to @product
		else
			render :action =>'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
	    @product = Product.find(params[:id])
	    if @product.update_attributes(product_params)
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

  	def product_params
  		params.require(:product).permit(:name, :product_type, :description, :unit_price, :restaurant_id) 
  	end

  	def sort_column
    	Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end


