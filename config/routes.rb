Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'sign_up', sign_in: 'sign_in' }
  root 'home#index'

  resources :users do
    resources :products do
      resources :comments, :likes
    end
    member do
      get 'my_products', to: 'products#my_products'
    end
  end

  # get "/users/:user_id/products", to: "products#index"
  # get "/users/:user_id/products/:id/edit", to: "products#edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
