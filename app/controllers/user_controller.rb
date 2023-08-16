class UserController < ApplicationController
  def new
    @user = User.new
  end

  def login
    if request.post?
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged in successfully"
      else
        flash.now[:alert] = "Invalid email or password."
        render :new
      end
    else
      @user = User.new
    end
  end

  def login_form
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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
