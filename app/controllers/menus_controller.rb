class MenusController < ApplicationController
	def index
		@menus = Menu.all.paginate(:per_page => 6, :page => params[:page])
		@menu = Menu.new
	end

	def show
		@menu = Menu.find(params[:id])
	end

	def new
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
	    if @menu.update_attributes(menu_params)
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
  		params.require(:menu).permit(:name, :type_menu, :price, :description, :restaurant_id, :user_id, :is_available)
  	end
end