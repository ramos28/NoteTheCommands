class StocksController < ApplicationController
	def index
		@stocks = Stock.all.order("quantity ASC").paginate(:per_page => 7, :page => params[:page])
	    if params[:description_stock].present?
	      	@stocks = @stocks.where("description_stock LIKE ?", "%#{params[:description_stock]}%")
	    end
	end

	def show
		@stock = Stock.find(params[:id])
	end

	def new
		@stock = Stock.new
	end
	
	def edit
		@stock = Stock.find(params[:id])
	end

	def create
		@stock = Stock.new(stock_params)
		if @stock.save
			flash[:notice] = "Successfully created stock."
			redirect_to @stock
		else
			render :action =>'new'
		end
	end

	def update
	    @stock = Stock.find(params[:id])
	    if @stock.update_attributes(stock_params)
	      	flash[:notice] = "Successfully updated stock."
	      	redirect_to @stock
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@stock = Stock.find(params[:id])
	    	@stock.destroy
	    	flash[:notice] = "Successfully destroyed stock."
	    	redirect_to stocks_url
  	end
  
  	private
  	

  	def stock_params
  		params.require(:stock).permit(:quantity, :description_stock, :price_buy_unity, :product_id)

  	end

  	def sort_column
    		Stock.column_names.include?(params[:sort]) ? params[:sort] : "name"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end


