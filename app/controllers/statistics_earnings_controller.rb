class StatisticsEarningsController < ApplicationController
  def index
	@rank_products = []
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

	commands_ids = @current_restaurant.commands.where("created_at >= ? and created_at <= ?", start_date, end_date).pluck(:id)

	products = CommandProduct.where(:command_id => commands_ids)
  	products.group_by(&:product_id).map do |key, value|
  		@rank_products << {name: Product.find(key).name, y: (value.count.to_f/products.count.to_f) * 100 }
  	end
  end
end
