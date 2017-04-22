Rails.application.routes.draw do  

  root "photos#index"
  resources :pets
  resources :photos

  devise_for :users, controllers: {
        registrations: 'users/registrations'
   }
  resources :users, only: :show
  resources :languages, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
