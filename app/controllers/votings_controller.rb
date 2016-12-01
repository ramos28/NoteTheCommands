class VotingsController < ApplicationController
	def index
  		@restaurant_users = RestaurantUser.all
  		@votings = Voting.all
  		@voting = Voting.new
	end

	def create
		@voting = Voting.new(voting_params)
		if @voting.save
			flash[:notice] = "Successfully created voting."
			redirect_to @voting
		else
			render :action =>'new'
		end
	end

	def edit
		@voting = Voting.find(params[:id])
	end

	def update
	    @voting = Voting.find(params[:id])
	    if @voting.update_attributes(voting_params)
	      	flash[:notice] = "Successfully updated voting."
	      	redirect_to @voting
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
    	@voting = Voting.find(params[:id])
    	@voting.destroy
    	flash[:notice] = "Successfully destroyed voting."
    	redirect_to votings_url
  	end
  
  	private

  	def voting_params
  		params.require(:voting).permit(:answer, :restaurant_id, :questionnaire_id) 
  	end
end
