Rails.application.routes.draw do

  resources :users, only:[:index, :new, :create, :show, :edit, :destroy, :update]
  resources :sessions, only: [:create, :new, :destroy]
  resources :projects do
    resources :tasks do
      resources :comments, only: [:create, :destroy]
    end
  end


  root :to => "projects#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
