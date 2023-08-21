Rails.application.routes.draw do

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
  get 'book/edit/:id', to: 'book#edit'
  get 'book/destroy'
  get 'book/user'
  get 'book/review'
  
  root to: "book#index"
end
