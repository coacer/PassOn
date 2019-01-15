class UsersController < ApplicationController

before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: 'desc')
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @post_comments = @user.post_comments
    @likes = @user.likes
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile, :user_image)
  end
end
