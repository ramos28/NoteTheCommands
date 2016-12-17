class UsersController < ApplicationController
	def index
		@users = User.all.paginate(:per_page => 20, :page => params[:page])
	end
end
