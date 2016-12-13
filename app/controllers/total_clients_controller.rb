class TotalClientsController < ApplicationController
	def index
		@users = User.all.paginate(:per_page => 10, :page => params[:page])
	end
end
