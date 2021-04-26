require 'rails_helper'
RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します  
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    end
    it 'password:半角英数混合(半角英語のみ)' do
    end
    it 'emailが空では登録できない' do
      user = User.new(name: "testes", email: "", password: "aaaa1111", password_confirmation: "aaaa1111", j_name: "山田", j_k_name: "次郎", j_k_n_name: "ヤマダ", j_k_n_c_name: "ジロウ")
      user.valid?  
      #expect(user.errors.full_messages).to include("name can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(name: "testes2", email: "kkk@com", password: "", password_confirmation: "aaaa1111", j_name: "山田", j_k_name: "次郎", j_k_n_name: "ヤマダ", j_k_n_c_name: "ジロウ")
      user.valid?  
      #expect(user.errors.full_messages).to include("name can't be blank")
    end
    it 'emailが一意性でないと登録できない' do
    end
    it 'passwordが存在してもpassword_confirmationが同じでないと登録できない' do
    end
    it 'メールアドレスは、@を含まない登録できない' do
    end
  end
end