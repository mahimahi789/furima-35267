class BuyManagesController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @address_buy_manage = AddressBuyManage.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @address_buy_manage = AddressBuyManage.new(buy_manage_params)
    #binding.pry
    if @address_buy_manage.valid?
      pay_item
      @address_buy_manage.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def buy_manage_params
    params.require(:address_buy_manage).permit(:post_num, :area_id, :municipality, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_manage_params[:token],  
      currency: 'jpy'                 
    )
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @address_buy_manage
  end
end

