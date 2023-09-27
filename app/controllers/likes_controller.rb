class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = Like.new(user: current_user, post: @post)

    if @like.save
      flash.now[:notice] = 'Liked the post!'
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:alert] = 'Failed to like the post!'
    end
  end

  private

  def find_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
