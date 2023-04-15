class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
 scope :only_active, -> { where(is_active: true) }

 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :posts, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :post_comments, dependent: :destroy
 
# 退会機能：退会していない会員を定義
 def active_for_authentication?
  super && (is_deleted == false)
 end
 
end
