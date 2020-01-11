Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :homes, only: [:top,:about]
  resources :rooms, only: [:show,:index]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
