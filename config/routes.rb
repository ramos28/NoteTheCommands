Rails.application.routes.draw do
  devise_for :users

  get 'select_restaurant', to: 'restaurants_users#new'

  devise_scope :user do

    authenticated :user do
      root 'restaurants_users#index'
  	end

  	unauthenticated :user do
  		root 'devise/sessions#new' 
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
