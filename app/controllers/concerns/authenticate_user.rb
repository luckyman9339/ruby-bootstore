module AuthenticateUser
    extend ActiveSupport::Concern

    included do
        before_action :authenticate_user
    end  

    def authenticate_user
      unless current_user
        redirect_to register_path, alert: 'Please log in.'
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorize_admin
      redirect_to root_path, alert: 'Access denied.' unless current_user&.user_role == 'admin'
    end
end