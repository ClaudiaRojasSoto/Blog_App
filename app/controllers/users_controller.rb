class UsersController < ApplicationController
  def index
    # Catch the user list
    @users = User.all

    # Rest of the logic to show the user list on the view
  end

  def show
    # Found the user with the same ID of the parameter 'id' on the URL
    @user = User.find(params[:id])

    # Rest of the logic to show the user information on the view
  end
end
