Rails.application.routes.draw do
  resources :instructors
  resources :friendships
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :users, only: [:show, :index]
  resources :studios
  resources :attendees
  resources :spin_classes

  root to: "home#show"

  
end
