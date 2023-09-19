class UsersController < ApplicationController
  def index
    # Obtén la lista de todos los usuarios
    @users = User.all

    # Resto de la lógica para mostrar la lista de usuarios en la vista
  end

  def show
    # Encuentra al usuario cuyo ID coincide con el parámetro 'id' en la URL
    @user = User.find(params[:id])

    # Resto de la lógica para mostrar la información del usuario en la vista
  end
end
