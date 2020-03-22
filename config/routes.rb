Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  
  root to: "home#top"
  resources :homes, only: [:top,:about]
  resources :rooms, only: [:show,:index]
  resources :words do
    resources :likes, only: [:create, :destroy]
  end
  
  get "users/:id/like" => "users#like"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
