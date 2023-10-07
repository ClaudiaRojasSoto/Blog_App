class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }
  before_action :authenticate_user!, only: [:create]

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def create
    post = Post.find(params[:post_id])
    user = current_user
    new_comment = post.comments.new(comment_params.merge(author_id: user.id))

    if new_comment.save
      render json: { success: 'Comment added!' }
    else
      render json: { error: new_comment.errors.full_messages.join(', ') }
    end
  end

  private

  def comment_params
    params.permit(:text)
  end

  def current_user
    user_id = decoded_auth_token['user_id']
    User.find_by(id: user_id)
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    nil
  end

  def authenticate_user!
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end

  def decoded_auth_token
    token = request.headers['Authorization'].to_s.split.last
    JWT.decode(token, Rails.application.secret_key_base)[0]
  end
end
