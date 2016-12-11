class GuestsController < ApplicationController
  def index
    return if user_signed_in?
    name = "guest_#{Time.now.to_i}#{rand(100)}"
    u = User.create(user_name: name, :email => "#{name}@notethecommands.com", :birth_date => Time.now - 20.year)
    u.save(:validate => false)
    sign_in :user, u

    redirect_to restaurant_users_path
  end
end
