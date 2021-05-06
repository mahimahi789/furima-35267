class BuyManagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @address_buy_manage = AddressBuyManage.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.reload_buy_manage.present?
      redirect_to root_path
    end
  end
  
  def create
    @item = Item.find(params[:item_id])
    @address_buy_manage = AddressBuyManage.new(buy_manage_params)
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

  end
end

