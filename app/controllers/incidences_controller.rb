class IncidencesController < ApplicationController
  def index
		@incidences = Incidence.where("restaurant_id = ?", "#{@current_restaurant.id}").order("priority DESC").paginate(:per_page => 7, :page => params[:page])
		@incidences_solved = Incidence.where("restaurant_id = ? AND is_solved = true", "#{@current_restaurant.id}").order("priority DESC").paginate(:per_page => 7, :page => params[:page])
		@incidences_pending = Incidence.where("restaurant_id = ? AND is_solved = false", "#{@current_restaurant.id}").order("priority DESC").paginate(:per_page => 7, :page => params[:page])
	end

	def show
		@incidence = Incidence.find(params[:id])
	end

	def new
		@incidence = Incidence.new
	end

	def create
		@incidence = Incidence.new(incidence_params)
		if @incidence.save
			flash[:notice] = "Successfully created incidence."
			redirect_to @incidence
		else
			render :action =>'new'
		end
	end

	def edit
		@incidence = Incidence.find(params[:id])
	end

	def update
	    @incidence = Incidence.find(params[:id])
	    if @incidence.update_attributes(incidence_params)
	      	flash[:notice] = "Successfully updated incidence."
	      	redirect_to @incidence
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@incidence = Incidence.find(params[:id])
	    	@incidence.destroy
	    	flash[:notice] = "Successfully destroyed incidence."
	    	redirect_to incidendes_url
  	end
  
  	private

  	def incidence_params
  		params.require(:incidence).permit(:category, :title, :priority,:description, :is_solved, :date_start, :date_solution, :restaurant_id, :user_id)

  	end

  	def sort_column
    		Incidence.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
