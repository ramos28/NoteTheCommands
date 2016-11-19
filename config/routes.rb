Rails.application.routes.draw do
  get 'productos/index'

  devise_for :users

  get 'select_restaurant', to: 'restaurants_users#new'
  get 'restaurants_user', to: 'restaurants_users#index'
  get 'location_user', to: 'location#new'

  devise_scope :user do

    authenticated :user do
      root 'restaurants_users#index'
  	end

    authenticated :user do
      root 'location#new'
    end

  	unauthenticated :user do
  		root 'devise/sessions#new' 
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
