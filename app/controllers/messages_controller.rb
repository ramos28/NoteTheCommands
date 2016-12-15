class MessagesController < ApplicationController
	def index
		@restaurant_email = Restaurant.where("id = ?", "#{@current_restaurant}")
		#Bandeja de entrada
		if (@current_role == RestaurantUser::ROLES.index('GERENTE'))
			@messages_in = Message.all.where("user_for = ?", "#{current_user.email}").paginate(:per_page => 7, :page => params[:page])
		else 
			@messages_in = Message.all.where("user_for = ?", "#{current_user.email}").paginate(:per_page => 7, :page => params[:page])
		end
		#Bandeja de enviados
		if (@current_role == RestaurantUser::ROLES.index('GERENTE'))
			@messages_out = Message.all.where("user_from = ?", "#{current_user.email}").paginate(:per_page => 7, :page => params[:page])
		else 
			@messages_out = Message.all.where("user_from = ?", "#{current_user.email}").paginate(:per_page => 7, :page => params[:page])
		end

	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:notice] = "Successfully created message."
			redirect_to @message
		else
			render :action =>'new'
		end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
	    @message = Message.find(params[:id])
	    if @message.update_attributes(message_params)
	      	flash[:notice] = "Successfully updated message."
	      	redirect_to @message
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@message = Message.find(params[:id])
	    	@message.destroy
	    	flash[:notice] = "Successfully destroyed message."
	    	redirect_to messages_url
  	end
  
  	private

  	def message_params
  		params.require(:message).permit(:subject, :description, :is_view, :user_for, :user_from)

  	end

  	def sort_column
    		Message.column_names.include?(params[:sort]) ? params[:sort] : "subject"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
