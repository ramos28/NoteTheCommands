Rails.application.routes.draw do

    get 'blogs/index'

    get 'incidences/index'

    get 'messages/index'

    get 'news/index'

    get 'votings/index'

    get 'productos/index'

    get 'profile/index'

    devise_for :users
    resources :products
    resources :profile
    resources :stocks
    resources :restaurants
    resources :restaurant_users
    resources :questionnaires
    resources :votings
    resources :blogs
    resources :messages
    resources :incidences

    get 'select_restaurant', to: 'restaurants_users#new'
    #get 'restaurants_user', to: 'restaurants_users#index'
    get 'location_user', to: 'location#new'

    devise_scope :user do

        authenticated :user do
            root 'restaurant_users#index'
        end

        authenticated :user do
            root 'location#new'
        end

        unauthenticated :user do
            root 'devise/sessions#new' 
        end

        authenticated :user do
            root 'products#index'
        end

        authenticated :user do
            root 'votings#index'
        end

        authenticated :user do
            root 'profile#index'
        end

        authenticated :user do
            root 'stock#index'
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end