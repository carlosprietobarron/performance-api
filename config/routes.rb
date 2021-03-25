Rails.application.routes.draw do
  resources :indicators, only: [:index]
  resources :measures, only: [:create ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
