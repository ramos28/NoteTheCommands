class CommandsController < ApplicationController
	def index
		@commands = Command.where("restaurant_id = ?", "#{@current_restaurant.id}")
		@commands += @commands.select{|command| command.created_at >= Time.now.beginning_of_day}

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
	      	redirect_to :back
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

  	def finish
  		@command = Command.find(params[:command_id])
  		@command.command_products.pluck(:product_id, :quantity).each do |command_product|
  			stock = Stock.find_by_product_id(command_product[0])
  			if !stock.blank?
  				stock.update(:quantity, stock.quantity - command_product[1])
  			end

  		end
  		
  		@command.command_menus.each do |command_menu|
			command_menu.menu.products.each do |product|
				stock = Stock.find_by_product_id(product.id)
  				if !stock.blank?
  					stock.update(:quantity, stock.quantity - command_menu.quantity)
  				end
			end
  		end

  		redirect_to new_voting_path
  	end
  
  	private
  	
  	def command_params
  		params.require(:command).permit(:title, :place, :user_id, :restaurant_id, :description, :is_end, :is_served)
  	end

end
