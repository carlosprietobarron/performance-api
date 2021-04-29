Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :indicators, only: [:index, :create]
  resources :measures, only: [:create ]
  resources :users, only: [:create]
  post "/login", to: "sessions#login"
  get "/auto_login", to: "sessions#auto_login"

  # get '/indicators/:id/measures', to: 'indicators#measures', as: 'measurecol'
  # get '/users/login/', to: 'users#signin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
