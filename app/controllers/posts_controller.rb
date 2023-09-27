class PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts.page(params[:page]).per(3)
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

  def show
    @post = @user.posts.find(params[:id])
    @next_post = @user.posts.where('id > ?', @post.id).first
    @prev_post = @user.posts.where('id < ?', @post.id).last
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
