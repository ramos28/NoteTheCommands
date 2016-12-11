class TotalProductsController < ApplicationController
	def index
		@products = Product.all.paginate(:per_page => 12, :page => params[:page])
	end
end
