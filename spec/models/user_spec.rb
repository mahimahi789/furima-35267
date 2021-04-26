require 'rails_helper'
RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe User do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end
     # ユーザー新規登録についてのテストコードを記述します  
      it 'passwordとpassword_confirmationが6文字以上であれば登録
      できる' do
        @user.password = 'abcd12'
        @user.password_confirmation = 'abcd12'
        expect(@user).to be_valid
      end
      it 'emailが空では登録できない' do
        #user = User.new(name: "testes", email: "", password: "aaaa1111", password_confirmation: "aaaa1111", j_name: "山田", j_k_name: "次郎", j_k_n_name: "ヤマダ", j_k_n_c_name: "ジロウ")
        @user.email = ''
        @user.valid?  
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailが一意性でないと登録できない' do 
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが存在してもpassword_confirmationが同じでない
      と登録できない' do
        @user.password_confirmation = 'bbbb2222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'メールアドレスは、@を含まない登録できない' do
        @user.email = 'test.com'
        @user.valid?  
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end