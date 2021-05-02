class ItemsController < ApplicationController

  before_action :authenticate_user!,only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:show, :update, :edit]

  

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new 
    @item =Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_description,:category_id,:condition_id,:burden_id,:area_id,:days_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end
end