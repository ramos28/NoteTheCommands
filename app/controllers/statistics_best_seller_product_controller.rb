class StatisticsBestSellerProductController < ApplicationController
	def index
		@rank_products = []

	  	start_date = params[:start_date]
	  	end_date = params[:end_date]

		commands_ids = @current_restaurant.commands.where("created_at >= ? and created_at <= ?", start_date, end_date).pluck(:id)

		products = CommandProduct.where(:command_id => commands_ids)
	  	products.group_by(&:product_id).map do |key, value|
	  		@rank_products << {name: Product.find(key).name, y: (value.count.to_f/products.count.to_f) * 100 }
	  	end
	end
end
