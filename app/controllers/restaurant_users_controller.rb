class RestaurantUsersController < ApplicationController
  
    def index
        if current_user.superadmin
            @restaurant_users = RestaurantUser.where("rol = 1").or(RestaurantUser.where("rol = 2")).or(RestaurantUser.where("rol =3")).paginate(:per_page => 8, :page => params[:page])
        else
            @restaurant_users = RestaurantUser.where("user_id = ?", "#{current_user.id}").order('rol DESC').paginate(:per_page => 8, :page => params[:page])
        end
        if params[:name].present?
            @restaurant = Restaurant.where("name LIKE ?", params[:name])
            debugger
            @restaurant.each do |elemento|
                @restaurant_users = RestaurantUser.where("restaurant_id = ? AND user_id = ?", elemento.id, current_user.id)
            end
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

    def destroy
       @restaurant_user = RestaurantUser.find(params[:id])
       @restaurant_user.destroy
     
        redirect_to :back
    end

    private

    def restaurant_user_params
        params.require(:restaurant_user).permit(:restaurant_id, :user_id, :rol, :discount)

    end
end
