class ProfileController < ApplicationController
  def index
  	@restaurant_users = RestaurantUser.all
  end
end
