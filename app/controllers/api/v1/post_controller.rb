class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.includes(:comments, :likes)
    render json: @posts
  end

  def comments_for_post
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def create_comment
    comment = Comment.new(post_id: params[:post_id], text: params[:comment], author_id: current_user.id)
    if comment.save
      render json: comment
    else
      render json: { error: 'Error al crear el comentario' }
    end
  end
end
