Rails.application.routes.draw do

  get 'start/index'

  get 'productos/index'

  get 'profile/index'

    devise_for :users
    resources :products
    resources :profile
    resources :stocks
    resources :restaurants
    resources :restaurant_users


  get 'select_restaurant', to: 'restaurants_users#new'
  #get 'restaurants_user', to: 'restaurants_users#index'
  get 'location_user', to: 'location#new'

  devise_scope :user do

    authenticated :user do
      root 'start#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
