class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.where("restaurant_id = ?", "#{@current_restaurant.id}").order("date DESC").paginate(:per_page => 7, :page => params[:page])
		@reservation = Reservation.new
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			flash[:notice] = "Successfully created reservation."
			redirect_to @reservation
		else
			render :action =>'new'
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
	    @reservation = Reservation.find(params[:id])
	    if @reservation.update_attributes(reservation_params)
	      	flash[:notice] = "Successfully updated reservation."
	      	redirect_to @reservation
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@reservation = Reservation.find(params[:id])
	    	@reservation.destroy
	    	flash[:notice] = "Successfully destroyed reservation."
	    	redirect_to reservations_url
  	end
  
  	private

  	def reservation_params
  		params.require(:reservation).permit(:name, :num_persons, :date, :hour, :restaurant_id, :user_id, :menu_id, :phone)

  	end

  	def sort_column
    		Reservation.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
