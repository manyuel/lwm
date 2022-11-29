Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[new destroy]
  resources :products, only: %i[index show new create update edit destroy]
  get 'transactions/:id/confirmation', to: 'transactions#confirmation', as: 'confirmation'
<<<<<<< HEAD
  get 'dashboard', to: 'pages#user_dash', as: 'dashboard'
=======

  get 'dashboard', to: 'pages#user_dash', as: 'dashboard'

  get 'about', to: 'pages#about_us', as: 'about_us'

>>>>>>> af0a211d456edddc74382a722f5865ea5bf57b7d
end
