require 'rails_helper'

RSpec.describe AddressBuyManage, type: :model do
  describe '#create' do
    before do
      @address_buy_manage = FactoryBot.build(:address_buy_manage)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_buy_manage).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numが空だと保存できないこと' do
        @address_buy_manage.post_num = ''
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが半角を含んだ正しい形式でないと保存できないこと' do
        @address_buy_manage.post_num = '１１１'
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end
      it 'area_idを選択していないと保存できないこと' do
        @address_buy_manage.area_id = ''
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it 'area_idで1を選択すると保存できないこと' do
        @address_buy_manage.area_id = '1'
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Area must be other than 1")
      end
      it 'buildingは空でも保存できること' do
        @address_buy_manage.building = ''
        expect(@address_buy_manage).to be_valid
      end
      it 'addressは空だと保存できないこと' do
        @address_buy_manage.address = ''
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Address can't be blank")
      end
      it 'municipalityは空だと保存できないこと' do
        @address_buy_manage.municipality = ''
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @address_buy_manage.phone_num = ''
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Phone num can't be blank", "Phone num is invalid")
      end
      it 'phone_numが全角数字だと保存できないこと' do
        @address_buy_manage.phone_num = '１２３４５６７８９０１'
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Phone num is invalid")
      end
      it "tokenが空では登録できないこと" do
        @address_buy_manage.token = nil
        @address_buy_manage.valid?
        expect(@address_buy_manage.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end