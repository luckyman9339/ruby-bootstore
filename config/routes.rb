Rails.application.routes.draw do

  get 'register', to: 'user#new'
  get 'login', to: 'user#login_form', as: :login
  post 'user/login', to: 'user#login'
  post 'user/create'
  get 'user/logout'

  get 'book/show'
  get 'book/new'
  post 'book/create'
  get 'book/edit'
  get 'book/destroy'
  get 'book/user'
  get 'book/review'
  
  root to: "book#index"
end
