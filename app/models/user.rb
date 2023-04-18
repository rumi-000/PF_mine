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
 
 # ゲストログイン機能：ログインに必要な情報を渡す
 def self.guest
  find_or_create_by!(email: 'guest@example.com') do |user|
   user.password = SecureRandom.urlsafe_base64
   user.password_confirmation = user.password
   user.name = "ゲストユーザー"
  end
 end
  
end
