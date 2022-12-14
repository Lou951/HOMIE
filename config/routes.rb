Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :products, only: %i[create new]

  resources :lists do
    resources :list_products, only: %i[new create index destroy]
    resources :user_lists, only: %i[new create]
  end

  resources :list_products, only: :show do
    resources :purchases, only: %i[new create]
  end

  get "/wallet", to: "wallets#wallet", as: :wallet

  resources :user_lists, only: :destroy
  resources :users, only: :show
end
