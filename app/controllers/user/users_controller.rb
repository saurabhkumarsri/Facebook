class User::UsersController < ApplicationController
  before_action :require_login, only: [:index]
  def index
    @user = User.all
    @posts = Post.includes(:user).all
  end

  def post_create
    @post = Post.new(title:params[:title],image:params[:image],user_id:current_user.id)
    @post.save
    redirect_to user_users_index_path
  end
end
