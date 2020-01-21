Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  root to: "home#top"
  resources :homes, only: [:top,:about]
  resources :rooms, only: [:show,:new,:create] 
  resources :messages, only:[:new,:create]
  resources :users, only: [:show,:edit,:update]
  mount ActionCable.server => '/cable'
end
