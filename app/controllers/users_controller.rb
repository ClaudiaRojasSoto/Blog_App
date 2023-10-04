class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @three_most_recent_posts = @user.posts.order(created_at: :desc).limit(3)
  end
end
