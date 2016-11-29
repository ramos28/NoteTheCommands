class TakeawaysController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@takeaways = Takeaway.all
	end

	def show
		@restaurant_users = RestaurantUser.all
		@takeaway = Takeaway.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@takeaway = Takeaway.new
	end

	def create
		@takeaway = Takeaway.new(takeaway_params)
		if @takeaway.save
			flash[:notice] = "Successfully created takeaway."
			redirect_to @takeaway
		else
			render :action =>'new'
		end
	end

	def edit
		@takeaway = Takeaway.find(params[:id])
	end

	def update
	    @takeaway = Takeaway.find(params[:id])
	    if @takeaway.update_attributes(params[:takeaway])
	      	flash[:notice] = "Successfully updated takeaway."
	      	redirect_to @takeaway
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@takeaway = Takeaway.find(params[:id])
	    	@takeaway.destroy
	    	flash[:notice] = "Successfully destroyed takeaway."
	    	redirect_to takeaways_url
  	end
  
  	private

  	def takeaway_params
  		params.require(:takeaway).permit(:name, :date, :hour, :product, :quantity, :total_price_selection, :restaurant_id)

  	end

  	def sort_column
    		Takeaway.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
