require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    describe '#create' do
      before do
        @item = FactoryBot.build(:item)
      end
      context 'ユーザーの商品出品ができる時' do
        it '正しい情報が入力されていれば、登録できる' do
          expect(@item).to be_valid
        end
      end
      context 'ユーザーの商品出品ができる時' do
        it '出品画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "item_nameが41文字以上だと出品できない" do
          @item.item_name = "a" * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
        end

        it "item_descriptionが1001文字以上だと出品できない" do
          @item.item_description = "a" * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description is too long (maximum is 1000 characters)")
        end

        it "category_idは空では登録できない" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "category_idは1では登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "burden_idは空では登録できない" do
          @item.burden_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
        end

        it "burden_idは1では登録できない" do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden must be other than 1")
        end

        it "area_idは空では登録できない" do
          @item.area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
        end

        it "area_idは1では登録できない" do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end

        it "days_idは空では登録できない" do
          @item.days_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days can't be blank", "Days is not a number")
        end

        it "days_idは1では登録できない" do
          @item.days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days must be other than 1")
        end

        it "priceは全角文字では登録できないこと" do
          @item.price = '１１１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceは半角英数混合では登録できないこと" do
          @item.price = '1a1a1aa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceは半角英語だけでは登録できないこと" do
          @item.price = 'aaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceは299円以下では登録できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end

        it "priceは10,000,000円以上では登録できないこと" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end
      end
    end
  end
end





#10,000,000円以上では登録できないこと