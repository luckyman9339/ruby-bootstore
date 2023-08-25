class ApplicationController < ActionController::Base
  before_action :user
  
    def user
      @role = JWT.decode(session[:user], 'abcd', true, algorithm: 'HS256')[0]["user_role"] unless !session[:user]
      @id = JWT.decode(session[:user], 'abcd', true, algorithm: 'HS256')[0]["user_id"] unless !session[:user]
      @token = (session[:user].to_json.html_safe if session[:user].to_json)
    end
  end
  
