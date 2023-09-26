# app/controllers/posts_controller.rb

class PostsController < ApplicationController
  def index
    # Catch the user which 'author_id' is the same as the parameter 'user_id' on the URL
    @user = User.find(params[:user_id])

    # Catch all the posts associates to this user and paginate them
    @posts = @user.posts.page(params[:page]).per(3)

    # @posts = @user.posts.paginate(page: params[:page], per_page: 4)

    # Rest of the logic to show the posts on the view
  end

  def show
    # Found the post which 'id' is the same as the parameter 'id' on the URL
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @next_post = @user.posts.where('id > ?', @post.id).first
    @prev_post = @user.posts.where('id < ?', @post.id).last
    # Rest of the logic to show the information of the post on the view
  end
end
