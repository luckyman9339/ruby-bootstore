class ApplicationController < ActionController::Base
    before_action :authenticate_user
  
    private
  
    def authenticate_user
      unless current_user
        byebug
        redirect_to user_new_path, alert: 'Please log in.'
      end
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    helper_method :current_user
  
    # Implement a method for role-based authorization
    def authorize_admin
      redirect_to root_path, alert: 'Access denied.' unless current_user&.admin?
    end
  end
  
