class CommandsController < ApplicationController
	def index
		@restaurant_users = RestaurantUser.all
		@commands = Command.all
		@command = Command.new
	end

	def show
		@restaurant_users = RestaurantUser.all
		@command = Command.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@command = Command.new
	end

	def create
		@command = Command.new(command_params)
		if @command.save
			flash[:notice] = "Successfully created command."
			redirect_to @command
		else
			render :action =>'new'
		end
	end

	def edit
		@command = Command.find(params[:id])
	end

	def update
	    @command = Command.find(params[:id])
	    if @command.update_attributes(command_params)
	      	flash[:notice] = "Successfully updated command."
	      	redirect_to @command
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@command = Command.find(params[:id])
	    	@command.destroy
	    	flash[:notice] = "Successfully destroyed command."
	    	redirect_to commands_url
  	end
  
  	private

  	def command_params
  		params.require(:command).permit(:title, :location, :menu_id, :producto_id, :description, :is_end)

  	end

end
