Rails.application.routes.draw do
  resources :indicators, only: [:index, :show]
  resources :measures, only: [:create ]
  resources :users, only: [:create]
  get '/indicators/:id/measures', to: 'indicators#measures', as: 'measurecol'
  get '/users/login/', to: 'users#signin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
