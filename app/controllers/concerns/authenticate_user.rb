module AuthenticateUser
    extend ActiveSupport::Concern

    def authorize_admin
      redirect_to root_path, alert: 'Access denied.' unless current_user == 'admin'
    end

    def authenticate_request
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, 'abcd', true, algorithm: 'HS256')
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end

end