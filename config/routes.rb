Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :products, only: %i[create new]

  resources :lists do
    resources :list_products, only: %i[new create index]
  end
end
