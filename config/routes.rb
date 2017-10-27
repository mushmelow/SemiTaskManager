Rails.application.routes.draw do

  resources :users, only:[:new, :create]
  resources :tasks
  resources :sessions, only: [:create, :new, :destroy]

  root :to => "tasks#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
