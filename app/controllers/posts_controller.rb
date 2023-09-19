class PostsController < ApplicationController
  def index
    # Catch the user which 'author_id' is the same as the parameter 'user_id' on the URL
    user = User.find(params[:user_id])

    # catch all the posts associates to this user
    @posts = user.posts

    # Rest of the logic to show the posts on the view
  end

  def show
    # found the post which 'id' is the same as the parameter 'id' on the URL
    @post = Post.find(params[:id])

    # Rest of the logic to show the information of the post on the view
  end
end
