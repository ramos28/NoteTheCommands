class ProductsController < ApplicationController
	helper_method :sort_column, :sort_direction

  	def index
  		@products = Product.where("restaurant_id = ?", "#{@current_restaurant.id}").order("type_product DESC").search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 12, :page => params[:page])
		@product = Product.new
	    if params[:name].present?
	      	@products = @products.where("name LIKE ?", "%#{params[:name]}%")
	    end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "Successfully created product."
			redirect_to :back
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
  		params.require(:product).permit(:name, :type_product, :ingredients, :preparation, :price, :younger, :restaurant_id) 
  	end

  	def sort_column
    	Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end