class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :birthday
  end   

  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "には全角文字を使用してください"} do
    validates :j_name
    validates :j_k_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください"} do
    validates :j_k_n_name
    validates :j_k_n_c_name
  end

  has_many :items
  has_many :buy_manages
end
