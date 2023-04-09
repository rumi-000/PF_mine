class Post < ApplicationRecord
  
  belongs_to :user
  
  
  # 画像の設定
  has_one_attached :image
  validates :image, presence: true


  #タグ機能
  has_many :post_tag_relations, dependent: :destroy
  #(後で消す。throughとは？)
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け、らしい
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  
  
  # いいね機能
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  #コメント機能
  has_many :post_comments, dependent: :destroy
  
end

