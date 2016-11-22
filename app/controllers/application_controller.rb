class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	@restaurant_users = RestaurantUser.all
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :phone, :user_type])
  end
end
