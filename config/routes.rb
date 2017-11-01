Rails.application.routes.draw do

  resources :users, only:[:index, :new, :create, :show, :edit]
  resources :sessions, only: [:create, :new, :destroy]
  resources :tasks do
    resources :comments, only: [:create]
  end


  root :to => "tasks#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
