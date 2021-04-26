class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :j_name, format: {with: /\A[ぁ-んァ-ヶ一-龥]/, message: "には全角文字を使用してください"}
    validates :j_k_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角漢字ひらがなカタカナを使用してください"}
    validates :j_k_n_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください"}
    validates :j_k_n_c_name, format: {with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください"}
    validates :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :birthday
  end   


  #has_many :items
  #has_many :buy_manages
end
