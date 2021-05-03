class AddressBuyManage < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_num, :area_id, :municipality, :address, :building, :phone_num, :user_id, :item_id, :buy_manage_id

  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :municipality
    validates :address
    validates :building
    validates :phone_num, format: {with: /\A[0-9]{11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :buy_manage_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    address = Address.create(post_num: post_num, area_id: area_id, municipality: municipality, address: address, building: building, phone_num: phone_num, buy_manage_id: buy_manage_id)
    Buy_manage.create(user_id: user_id, item_id: item_id)
  end
end