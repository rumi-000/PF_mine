class PostTag < ApplicationRecord
  
  belongs_to :post
  belongs_to :tag
  validates :post_id, presence: true
  validates :tag_id, presence: true
  validate :check_tag_id_published, if: -> { tag_id.present? }
  
  def check_post_published
   unless tag.published?
    errors.add(:tag, "must be published to add tags")
   end
  end
end
