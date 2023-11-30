class User::SessionsController < ApplicationController
  before_action :require_login, only: [:logout]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_users_index_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def create
    existing_user = User.find_by(email: user_params[:email])
    if existing_user
      flash[:danger] = 'Email is already taken'
      redirect_to user_login_path
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to user_users_index_path
      else
        flash.now[:danger] = 'User could not be created'
        render user_login_path
      end
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to user_login_path, notice: 'You have been logged out.'
  end

  private

  def user_params
      params.permit(:fname, :description, :contact, :email, :password )
  end
end
