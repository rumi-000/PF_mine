class Tag < ApplicationRecord
  
  has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts,through: :post_tags

  #バリデーショn
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  
  has_one_attached :image
end

