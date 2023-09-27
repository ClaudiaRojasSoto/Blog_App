class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    # Lógica para crear un nuevo comentario
  end

  # Otras acciones, como editar, actualizar, eliminar, etc.
end
