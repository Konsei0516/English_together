Rails.application.routes.draw do

  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  
  root to: "home#top"
  resources :homes, only: [:top,:about]
  resources :rooms, only: [:show,:index]
  resources :words
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
