class CurriculumsController < ApplicationController
    def new
    end

    def create
    	@curriculum = Curriculum.new(curriculum_params)
    	@curriculum.save

    	redirect_to :back
    end

    private

    def curriculum_params
  		params.require(:curriculum).permit(:restaurant_id, :file)

    end

end
