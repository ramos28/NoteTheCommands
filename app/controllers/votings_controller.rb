class VotingsController < ApplicationController
	def index
  		@restaurant_users = RestaurantUser.all
  		@votings = Voting.all
  		@questionaires = Questionnaire.all
  		@voting = Voting.new
	end

	def create
    params[:voting][:questions].keys.each do |question_id|
      debugger
      @voting = Voting.new(restaurant_id: params[:voting][:restaurant_id], questionnaire_id: question_id, answer: params[:voting][:questions][question_id][:answer])
      @voting.save
    end

		redirect_to start_path
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
  		params.require(:voting).permit(:questions, :restaurant_id) 
  	end
end
