class StatisticsBestSellerProductController < ApplicationController
	def index
		@rank_products = []

		@products = Product.where("restaurant_id = ?", "#{@current_restaurant.id}").order("type_product DESC").search(params[:search])
		if params[:name].present?
	      	@products = @products.where("name LIKE ?", "%#{params[:name]}%")
	    end

	  	start_date = params[:start_date]
	  	end_date = params[:end_date]
	  	select_category = params[:select_category]

	  	@start = start_date
	  	@end = end_date

	  	if select_category == ""
	  		@category = "-- TODAS --"
	  	else
	  		@category = select_category
	  	end

		commands_ids = @current_restaurant.commands.where("created_at >= ? and created_at <= ?", start_date, end_date).pluck(:id)

	  	#debugger

	  	if select_category == ""
	  		products_ids = @current_restaurant.products.order("name ASC")
	  		products = CommandProduct.where(:command_id => commands_ids)
	  	else
	  		products_ids = @current_restaurant.products.where("type_product = ?", select_category)
	  		products = CommandProduct.where(:command_id => commands_ids, :product_id => products_ids)
	  	end		
		
		@products_ids_aux = products_ids.paginate(:per_page => 10, :page => params[:page]).order("name ASC")
	  	products.group_by(&:product_id).map do |key, value|
	  		@rank_products << {name: Product.find(key).name, y: (value.count.to_f/products.count.to_f) * 100 }
	  	end
	end
end
