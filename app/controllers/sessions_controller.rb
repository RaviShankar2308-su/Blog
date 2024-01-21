# frozen_string_literal: true

# It creates the session whenever user login
# User can login by email/username and password
# return the newly created session token
class SessionsController < ApplicationController
  def new
    @user = params[:email].present? ? User.find_by(email: params[:email]) : User.find_by(username: params[:username])
  end

  def create
    @user = params[:email].present? ? User.find_by(email: params[:email]) : User.find_by(username: params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
