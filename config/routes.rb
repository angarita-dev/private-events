Rails.application.routes.draw do
  root "users#show"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
