class SessionsController < ApplicationController
  def new
    # This renders the login form
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])  # authenticate method from bcrypt
      session[:user_id] = user.id  # Create a session for the user
      Rails.logger.debug "Session data after login: #{session.inspect}"
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Log out the user by clearing the session
    redirect_to login_path, notice: 'Logged out successfully!'
  end
end
