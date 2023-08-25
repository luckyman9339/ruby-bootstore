class BookController < ApplicationController
  
  include AuthenticateUser

  before_action :authorize_admin, only: [:new, :edit, :destroy]

  def index
    payload = { user_id: 1, user_role: "guest" }
    session[:user] = JWT.encode(payload, 'abcd', 'HS256') unless session[:user]
  end
  
  def show
   @book_id = params[:id]
  end
  
  def new
  end
  
end
