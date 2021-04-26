class UsersController < ApplicationController

  def index
  end

  def edit
  end

  def update
    #current_user.update(user_params)
  end

  def show
    user = User.find(params[:id])
   # @name = user.name
   # @items = user.items  
  end

  def create
  end

  private

  #def user_params
   # params.require(:user).permit(:name, :email)
  #end

end
