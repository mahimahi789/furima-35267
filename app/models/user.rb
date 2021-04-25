class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  validates :name, presence: true      
  validates :email, presence: true     
  validates :encrypted_password, presence: true
  validates :j_name,  presence: true 
  validates :j_k_name, presence: true 
  validates :j_k_n_name, presence: true 
  validates :j_k_n_c_name, presence: true 
  validates :birthday, presence: true 

  has_many :items
  has_many :buy_manages
end
