class Post < ApplicationRecord
  
  belongs_to :user
  
  # バリデーション
  validates :item_name, presence: true
  validates :item_description, presence: true

  # 画像の設定
  has_one_attached :image
  validates :image, presence: true

  #タグ機能
  has_many :post_tags, dependent: :destroy
  has_many :tags,through: :post_tags
  
  # いいね機能
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end
  
  #コメント機能
  has_many :post_comments, dependent: :destroy
  
end