class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :days

  has_one :buy_manage
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length:{maximum:40}
    validates :item_description, length:{maximum:1000}
    validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10000000 }
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :days_id
  end

end
