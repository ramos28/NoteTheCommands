Rails.application.routes.draw do
  get 'users/index'

    get 'emails/index'
    get 'emails/new'
    get 'emails/edit'
    get 'emails/show'
    get 'emails/_form'
    get 'product_takeaways/index'
    get 'total_restaurants/index'
    get 'total_products/index'
    get 'total_clients/index'
    get 'product_commands/index'
    get 'menu_commands/index'
    get 'menus/index'
    get 'commands/index'
    get 'takeaways/index'
    get 'reservations/index'
    get 'blogs/index'
    get 'incidences/index'
    get 'messages/index'
    get 'news/index'
    get 'votings/index'
    get 'productos/index'
    get 'profile/index'
    get 'restaurants/select'
    get 'guests/index'

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
    resources :reservations
    resources :takeaways
    resources :locations
    resources :menus
    resources :commands
    resources :menu_products
    resources :emails
    resources :users, only: [:index]
    resources :personal_messages, only: [:new, :create]
    resources :conversations, only: [:index, :show]

    get 'select_restaurant', to: 'restaurants_users#new'
    #get 'restaurants_user', to: 'restaurants_users#index'
    get 'location_user', to: 'location#new'
    get 'start', to: 'start#index'

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

        authenticated :user do
            root 'takeaway#index'
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
