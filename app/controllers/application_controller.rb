class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	before_filter :set_current_user_restaurant_role
  	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :phone, :birth_date, :total_spent, :superadmin])
	end

	def set_current_user_restaurant_role
		@current_restaurant = nil
		@current_role = nil
		@current_discount = nil
		
		if current_user
			current_restaurant_user = RestaurantUser.where(:id => current_user.current_user_restaurant).first

			if current_restaurant_user
				@current_restaurant = current_restaurant_user.restaurant
				@current_role = current_restaurant_user.rol
				@current_discount = current_restaurant_user.discount
			end
		end
	end
end
