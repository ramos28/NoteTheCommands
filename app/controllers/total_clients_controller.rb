class TotalClientsController < ApplicationController
	def index
		@users = User.all.paginate(:per_page => 12, :page => params[:page])
	end
end
