Rails.application.routes.draw do

  get 'user/new', to: 'user#new'
  get 'user/login', to: 'user#login_form', as: :login
  post 'user/login', to: 'user#login'
  get 'user/logout'
  post 'user/create'

  get 'book/show'
  get 'book/new'
  get 'book/create'
  get 'book/edit'
  get 'book/destroy'
  get 'book/user'
  get 'book/review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "book#index"
end
