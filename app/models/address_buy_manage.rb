class AddressBuyManage 
  include ActiveModel::Model
  attr_accessor :post_num, :area_id, :municipality, :address, :building, :phone_num, :user_id, :item_id, :buy_manage_id, :token


  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  
  end
 

  def save
    buy_manage = BuyManage.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, area_id: area_id, municipality: municipality, address: address, building: building, phone_num: phone_num, buy_manage_id: buy_manage.id)
  end
end
