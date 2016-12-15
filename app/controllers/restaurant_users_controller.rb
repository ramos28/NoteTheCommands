class RestaurantUsersController < ApplicationController
  
    def index
        if current_user.superadmin
            @restaurant_users = RestaurantUser.where("rol = 1").or(RestaurantUser.where("rol = 2")).or(RestaurantUser.where("rol =3")).paginate(:per_page => 8, :page => params[:page])
        else
            @restaurant_users = RestaurantUser.where("user_id = ?", "#{current_user.id}").paginate(:per_page => 8, :page => params[:page])
        end
        @restaurants_users = RestaurantUser.new
    end

    def create
        @restaurant_user = RestaurantUser.new(restaurant_user_params)
        @restaurant_user.rol = RestaurantUser::ROLES.index('CLIENTE') if @restaurant_user.rol.blank?
        @restaurant_user.user = current_user if @restaurant_user.user_id.blank?
        if (@restaurant_user.rol == RestaurantUser::ROLES.index('GERENTE'))
            @restaurant_user.discount = 30
        elsif (@restaurant_user.rol == RestaurantUser::ROLES.index('CAMARERO') || @restaurant_user.rol == RestaurantUser::ROLES.index('COCINERO'))
            @restaurant_user.discount = 10
        end
        @restaurant_user.save

        redirect_to root_path
    end

    private

    def restaurant_user_params
        params.require(:restaurant_user).permit(:restaurant_id, :user_id, :rol, :discount)

    end
end
