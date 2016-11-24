class QuestionnairesController < ApplicationController
	helper_method :sort_column, :sort_direction

  	def index
  		@restaurant_users = RestaurantUser.all
  		@questionnaires = Questionnaire.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 7, :page => params[:page])
		@questionnaire = Questionnaire.new
	end

	def show
		@restaurant_users = RestaurantUser.all
		@questionnaire = Questionnaire.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@questionnaire = Questionnaire.new
	end

	def create
		@questionnaire = Questionnaire.new(questionnaire_params)
		if @questionnaire.save
			flash[:notice] = "Successfully created product."
			redirect_to @questionnaire
		else
			render :action =>'new'
		end
	end

	def edit
		@questionnaire = Questionnaire.find(params[:id])
	end

	def update
	    @questionnaire = Questionnaire.find(params[:id])
	    if @questionnaire.update_attributes(params[:questionnaire])
	      	flash[:notice] = "Successfully updated questionnaire."
	      	redirect_to @questionnaire
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
    	@questionnaire = Questionnaire.find(params[:id])
    	@questionnaire.destroy
    	flash[:notice] = "Successfully destroyed questionnaire."
    	redirect_to questionnaires_url
  	end
  
  	private

  	def questionnaire_params
  		params.require(:questionnaire).permit(:question, :restaurant_id) 
  	end

  	def sort_column
    	Product.column_names.include?(params[:sort]) ? params[:sort] : "restaurant_id"
  	end
  
  	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end