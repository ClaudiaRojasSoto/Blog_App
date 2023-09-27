class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.order(created_at: :desc).first
  end
end
