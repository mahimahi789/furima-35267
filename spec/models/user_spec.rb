require 'rails_helper'
RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe User do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end
     # ユーザー新規登録についてのテストコードを記述します  
      
      context 'ユーザーの新規登録ができる時' do
        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = 'abcd12'
          @user.password_confirmation = 'abcd12'
          expect(@user).to be_valid
        end
        it '正しい情報が入力されていれば、登録できる' do
          expect(@user).to be_valid
        end
      end
      context 'ユーザーの新規登録ができない時' do
        it 'emailが空では登録できない' do
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
        it 'passwordが存在してもpassword_confirmationが同じでないと登録できない' do
          @user.password = 'cccc3333'
          @user.password_confirmation = 'bbbb2222'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'メールアドレスは、@を含まないと登録できない' do
          @user.email = 'test.com'
          @user.valid?  
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが英語のみでは登録できない' do
          @user.password = 'bbbbbbbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが6文字以上でないと登録できない' do
          @user.password = 'bbb2'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが数字のみでは登録できない' do
          @user.password = '1111111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it 'j_nameが空では登録できない' do
          @user.j_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("J name can't be blank")
        end
        it 'j_nameが全角以外では登録できない' do
          @user.j_name = 'hoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('J name には全角文字を使用してください')
        end
        it 'j_k_nameが空では登録できない' do
          @user.j_k_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("J k name can't be blank")
        end
        it 'j_k_nameが全角以外では登録できない' do
          @user.j_k_name = 'hoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('J k name には全角文字を使用してください')
        end
        it 'j_k_n_nameが空では登録できない' do
          @user.j_k_n_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("J k n name can't be blank")
        end 
        it 'j_k_n_nameがカタカナ以外では登録できない' do
          @user.j_k_n_name = 'あああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('J k n name には全角カタカナを使用してください')
        end
        it 'j_k_n_c_nameが空では登録できない' do
          @user.j_k_n_c_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("J k n c name can't be blank")
        end
        it 'j_k_n_c_nameがカタカナ以外では登録できない' do
          @user.j_k_n_c_name = 'ｱｱｱｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include('J k n c name には全角カタカナを使用してください')
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        it 'password全角では登録できない' do
          @user.password_confirmation = 'ああああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end







