class UsersController < ApplicationController

  before_action :set_user, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log the user in immediately after signup
      redirect_to root_path, notice: 'User created and logged in successfully!'
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: 'User Deleted'
    else
      render :new
    end

  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    render json: { error: "User not found" }, status: :not_found unless @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
