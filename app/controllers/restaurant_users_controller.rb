class RestaurantUsersController < ApplicationController
  
    def index
        @restaurant_users = RestaurantUser.all
        @restaurants_users = RestaurantUser.new
    end

    def create
        @restaurant_user = RestaurantUser.new(restaurant_user_params)
        @restaurant_user.rol = RestaurantUser::ROLES.index('CLIENTE')
        @restaurant_user.user = current_user
        @restaurant_user.save

        redirect_to root_path
    end



    private

    def restaurant_user_params
        params.require(:restaurant_user).permit(:restaurant_id)

    end
end
