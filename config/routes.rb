Rails.application.routes.draw do
  root "events#index"
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events
  
  get 'events/:id/attending', to: 'events#attend_to_event', as: 'attend_to_event'
end
