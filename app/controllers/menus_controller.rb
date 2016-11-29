class MenusController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@menus = Menu.all
	end

	def show
		@restaurant_users = RestaurantUser.all
		@menu = Menu.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@menu = Menu.new
	end

	def create
		@menu = Menu.new(menu_params)
		if @menu.save
			flash[:notice] = "Successfully created menu."
			redirect_to @menu
		else
			render :action =>'new'
		end
	end

	def edit
		@menu = Menu.find(params[:id])
	end

	def update
	    @menu = Menu.find(params[:id])
	    if @menu.update_attributes(params[:menu])
	      	flash[:notice] = "Successfully updated menu."
	      	redirect_to @menu
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@menu = Menu.find(params[:id])
	    	@menu.destroy
	    	flash[:notice] = "Successfully destroyed menu."
	    	redirect_to menus_url
  	end
  
  	private

  	def menu_params
  		params.require(:menu).permit(:type_menu, :price, :restaurant_id, :user_id)
end