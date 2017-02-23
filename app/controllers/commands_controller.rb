class CommandsController < ApplicationController
	def index

		@commands = @current_restaurant_user.commands.where("created_at >= ?", Time.now.beginning_of_day + (60*60*5)).paginate(:per_page => 8, :page => params[:page])
		@command_waiter = Command.where("restaurant_id = ? AND created_at >= ?", "#{@current_restaurant.id}", Time.now.beginning_of_day).paginate(:per_page => 8, :page => params[:page])
		@commands_gerente = Command.where("restaurant_id = ?", "#{@current_restaurant.id}").order('created_at DESC').paginate(:per_page => 8, :page => params[:page])
		#@commands += @commands.select{|command| command.created_at >= Time.now.beginning_of_day}
		#@commands_cooker = Command.where("restaurant_id = ? AND created_at >= ? ", "#{@current_restaurant.id}", "#{Time.now.beginning_of_day}").paginate(:per_page => 8, :page => params[:page])
	    @commands_cooker = []

	    @current_restaurant.commands.each do |command|
	      @commands_cooker += command.command_products.where(:is_served => false)
	    end

	    #@commands_cooker = @commands_cooker.order("is_cooked")

	    @ended = true
		@commands.pluck(:is_end).map {|e| @ended = @ended && e}
		#@commands_ends = Command.where("restaurant_id = ? AND is_end = true", "#{@current_restaurant.id}")
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
	      	if @command.is_served
	      		@command.command_products.each do |command_product|
	      			#command_product.update(:is_served => true) if (command_product.product.type_product == 6 || command_product.product.type_product == 7 || command_product.product.type_product == 8 || command_product.product.type_product == 9)
	              	command_product.update(:is_served => true) if command_product.is_cooked
	            end
	      	end
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
  		params.require(:command).permit(:title, :place, :restaurant_user_id, :restaurant_id, :description, :is_end, :is_served)
  	end

end
