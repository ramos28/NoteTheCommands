class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	before_filter :set_current_user_restaurant_role
  	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :phone, :user_type, :birth_date])
	end

	def set_current_user_restaurant_role
		if current_user
			@current_restaurant = current_user.current_user_restaurant
			@current_role = nil

			if !@current_restaurant.blank?
				@current_role = current_user.restaurant_users.find_by_restaurant_id(@current_restaurant).rol
			end
		else
			@current_restaurant = nil
			@current_role = nil 
		end
	end
end
