class RestaurantsUsersController < ApplicationController
  
  def index
  	@restaurant_users = current_user.restaurant_users
  end

  def new
  	@restaurants = Restaurant.all
  end
end
