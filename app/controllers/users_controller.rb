# frozen_string_literal: true

# user got signup and cerate the user session
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome to my Blog'
    else
      flash[:alert] = user.errors.full_messages.to_s
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
