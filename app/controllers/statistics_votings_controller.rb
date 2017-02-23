class StatisticsVotingsController < ApplicationController
	def index
		@rank_votings = []

	  	start_date = params[:start_date]
	  	end_date = params[:end_date]
		
		votings = @current_restaurant.votings.where("created_at >= ? and created_at <= ?", start_date, end_date)
		
		votings = votings.group_by(&:questionnaire_id).map do |key, value|
			average = 0	
			total = value.count
			value.map {|v| average += v.answer}
			average = average.to_f/total.to_f

			@rank_votings << {name: Questionnaire.find(key).question, y: average}
		end
	end
end
