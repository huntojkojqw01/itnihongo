Rails.application.routes.draw do  

  root "photos#index"
  resources :pets
  resources :photos

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        :omniauth_callbacks => "users/omniauth_callbacks"
   }
  
  resources :users, only: :show
  resources :languages, only: :create
  resources :albums, only: [:create,:new,:show, :index]
  resources :follows, only: [:create,:destroy,:show]
  resources :comments, only: [:create,:update,:destroy]
  resources :likes, only: [:create,:destroy]
  resources :searchs, only: :index
  resources :notifications, only: [:index,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
