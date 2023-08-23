Rails.application.routes.draw do

  resources :cart, only: [:index, :create, :destroy, :update]

  namespace :api do
    resources :books, only: [:index, :show, :create, :update, :destroy]
  end
  

  get 'register', to: 'user#new'
  get 'login', to: 'user#login_form', as: :login
  post 'user/login', to: 'user#login'
  post 'user/create'
  get 'user/logout'

  get 'book/:id', to: 'book#show', as: 'book'
  get 'book/new'
  get 'book/user'
  get 'book/review'
  
  root to: "book#index"
end
