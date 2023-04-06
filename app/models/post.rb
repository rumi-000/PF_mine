class Post < ApplicationRecord
  
  belongs_to :user
  
  has_one_attached :image
  validates :image, presence: true
  
  has_many :post_tag_relations, dependent: :destroy
  #(後で消す。throughとは？)
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け、らしい
  has_many :tags, through: :post_tag_relations, dependent: :destroy
end


