Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'sign_up', sign_in: 'sign_in' }
  root 'home#index'

  resources :users do
    resources :products do
      resources :comments
      resources :likes
      resources :events do
        resources :bookings, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      end
    end
    member do
      get 'my_products', to: 'products#my_products'
      get 'my_events', to: 'events#my_events'
      get 'purchase', to: 'bookings#purchase_event'
    end
  end

  get 'all_products', to: 'products#all_products', as: 'all_products'
  get 'all_events', to: 'events#all_events', as: 'all_events'
 

  # get "/users/:user_id/products", to: "products#index"
  # get "/users/:user_id/products/:id/edit", to: "products#edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
