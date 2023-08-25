class UserController < ApplicationController
  def new
    @user = User.new
    @user.user_role = params[:role] == 'admin' ? 'admin' : 'user'
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      payload = { user_id: @user.id, user_role: @user.user_role }
      session[:user] = JWT.encode(payload, 'abcd', 'HS256') 

      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email or password."
      redirect_to register_path
    end
  end
  

  def login_form
    @user = User.new
  end

  def logout
    session[:user] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = JWT.encode({ user_id: @user.id, user_role: @user.user_role }, 'abcd', 'HS256')
      redirect_to root_path, notice: "Registration successful. Welcome!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_role)
  end
end
