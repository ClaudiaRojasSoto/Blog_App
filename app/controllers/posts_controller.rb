class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  load_and_authorize_resource # Carga y autoriza automáticamente los recursos

  def index
    @posts = @user.posts.includes(:comments, :likes).page(params[:page]).per(3)
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'Post creation failed!'
      render :new
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    if @post.destroy
      flash[:notice] = 'Post deleted!'
      redirect_to user_posts_path(@user)
    else
      flash[:alert] = 'Failed to delete post!'
      redirect_to user_post_path(@user)
    end
  end

  def show
    @post = @user.posts.find_by(id: params[:id])
    # @comments = @post.comments
    if @post
      @next_post = @user.posts.where('id > ?', @post.id).first
      @prev_post = @user.posts.where('id < ?', @post.id).last
    else
      flash[:alert] = 'Post not found'
      redirect_to user_posts_path(@user)
    end
  end

  def new
    @post = @user.posts.build
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
