class BookController < ApplicationController
  
  include AuthenticateUser

  before_action :authorize_admin, only: [:new, :edit, :destroy]

  def index
    payload = { user_id: 1, user_role: "guest" }
    session[:user] = JWT.encode(payload, 'abcd', 'HS256') unless session[:user]

    @token = (session[:user].to_json.html_safe if session[:user].to_json)
    @role = JWT.decode(session[:user], 'abcd', true, algorithm: 'HS256')[0]["user_role"]
  end
  
  def show
    @token = (session[:user].to_json.html_safe if session[:user].to_json)
    @book_id = params[:id]
    @role = JWT.decode(session[:user], 'abcd', true, algorithm: 'HS256')[0]["user_role"]
  end
  
  def new
    @token = (session[:user].to_json.html_safe if session[:user].to_json)
  end

end
