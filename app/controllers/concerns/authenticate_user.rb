module AuthenticateUser
    extend ActiveSupport::Concern

    included do
        # before_action :authenticate_user
    end  

    def authenticate_user
      unless current_user
        redirect_to register_path, alert: 'Please log in.'
      end
    end

    def current_user
      @current_user ||= (JWT.decode("#{session[:user]}", 'abcd', true, algorithm: 'HS256')[0])["user_role"]
      # byebug
    end

    def authorize_admin
      redirect_to root_path, alert: 'Access denied.' unless current_user == 'admin'
    end

    def authenticate_request
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, 'abcd', true, algorithm: 'HS256')
      # @current_user = User.find(decoded_token.first['user_id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end

end