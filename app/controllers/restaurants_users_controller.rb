class RestaurantsUsersController < ApplicationController
  
  def index
  	@restaurant_users = current_user.restaurant_users
  end

  def new
  	@restaurant_users = current_user
  end
end
