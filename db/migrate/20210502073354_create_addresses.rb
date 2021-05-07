class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :post_num
      t.integer      :area_id         ,null: false
      t.string       :municipality    ,null: false
      t.string       :address         ,null: false
      t.string       :building      
      t.string       :phone_num       ,null: false
      t.integer      :buy_manage_id   ,null: false,foreign_key: true
      t.timestamps
    end
  end
end
