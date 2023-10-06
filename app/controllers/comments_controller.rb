class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_and_post
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment = @post.comments.find(params[:comment_id])
    if @comment.destroy
      flash[:notice] = 'Comment deleted!'
    else
      flash[:alert] = 'Failed to delete comment!'
    end
    redirect_to user_post_path(@user, @post)
  end

  private

  def find_user_and_post
    @user = User.where(id: params[:user_id]).first
    @post = Post.where(id: params[:post_id]).first
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
