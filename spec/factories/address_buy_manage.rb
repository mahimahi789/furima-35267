FactoryBot.define do
  factory :address_buy_manage do
    post_num { '123-4567'}
    area_id { 2 }
    municipality { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '柳ビル101' }
    phone_num { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 2 }
    item_id { 24 }
  end
end