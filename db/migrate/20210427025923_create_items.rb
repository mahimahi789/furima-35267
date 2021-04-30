class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :item_name, null: false
      t.text :item_description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false 
      t.integer :burden_id, null: false 
      t.integer :area_id, null: false 
      t.integer :days_id, null: false 
      t.integer :price, null: false 
      t.integer :user_id, null: false, foreign_key: true 
      t.timestamps
    end
  end
end