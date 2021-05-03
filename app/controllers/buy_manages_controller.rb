class BuyManagesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    @address_buy_manage = Address_Buymanage.new
  end

  #def new
  #end

  def create
    @address_buy_manage = Address_Buymanage.new(buy_manage_params)
    if @address_buy_manage.valid?
      @address_buy_manage.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_manage_params
    params.require(:address_buy_manage).permit(:post_num, :area_id, :municipality, :address, :building, :phone_num).merge(user_id: current_user.id)
  end
end
