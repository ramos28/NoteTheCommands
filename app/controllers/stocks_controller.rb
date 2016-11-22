class StocksController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@stocks = Stock.all
	end

	def show
		@restaurant_users = RestaurantUser.all
		@stock = Stock.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@stock = Stock.new
	end

	def create
		@stock = Stock.new(stock_params)
		debugger
		if @stock.save
			flash[:notice] = "Successfully created stock."
			redirect_to @stock
		else
			render :action =>'new'
		end
	end

	def edit
		@stock = Stock.find(params[:id])
	end

	def update
	    @stock = Stock.find(params[:id])
	    if @stock.update_attributes(params[:stock])
	      	flash[:notice] = "Successfully updated stock."
	      	redirect_to @stock
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@stock = Stock.find(params[:id])
	    	@stock.destroy
	    	flash[:notice] = "Successfully destroyed product."
	    	redirect_to stockss_url
  	end
  
  	private
  	

  	def stock_params
  		params.require(:stock).permit(:quantity, :description_stock, :price_buy_unity, :total_expenses_product, :product_id)

  	end

  	def sort_column
    		Stock.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end


