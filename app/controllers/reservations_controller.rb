class ReservationsController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@reservations = Reservation.all
	end

	def show
		@restaurant_users = RestaurantUser.all
		@reservation = Reservation.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
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
	    if @reservation.update_attributes(params[:reservation])
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
  		params.require(:reservation).permit(:num_persons, :date, :hour, :restaurant_id, :user_id, :phone)

  	end

  	def sort_column
    		Reservation.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
