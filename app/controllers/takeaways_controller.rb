class TakeawaysController < ApplicationController
	def index
		@takeaways = Takeaway.where("restaurant_id = ?", "#{@current_restaurant.id}").order("created_at ASC").paginate(:per_page => 7, :page => params[:page])
		@takeaway = Takeaway.new
	end

	def show
		@takeaway = Takeaway.find(params[:id])
	end

	def new
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
	    price = 0
		debugger
	    @takeaway.takeaway_product.each do |tp|
	    	price = tp.quantity * tp.product.price
	    end 

	    if @takeaway.update_attributes(:is_end => true, total_price_selection: price)
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

  	def deliver
		@takeaway = Takeaway.find(params[:takeaway_id])
		debugger
	
	    if @takeaway.update_attributes(:is_delivered => true)
	      	flash[:notice] = "Successfully updated takeaway."
	      	redirect_to :back
	    else
	      	render :action => 'edit'
	    end  	end
  
  	private

  	def takeaway_params
  		params.require(:takeaway).permit(:name, :date, :hour, :total_price_selection, :restaurant_id, :is_end)

  	end

  	def sort_column
    		Takeaway.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
