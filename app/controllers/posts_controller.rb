class PostsController < ApplicationController
  def index
    # Obtén el usuario cuyo 'author_id' coincide con el parámetro 'user_id' en la URL
    user = User.find(params[:user_id])

    # Luego, obtén todos los posts asociados a ese usuario
    @posts = user.posts

    # Resto de la lógica para mostrar los posts en la vista
  end

  def show
    # Encuentra el post cuyo 'id' coincide con el parámetro 'id' en la URL
    @post = Post.find(params[:id])

    # Resto de la lógica para mostrar la información del post en la vista
  end
end
