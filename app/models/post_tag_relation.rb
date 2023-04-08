class PostTagRelation < ApplicationRecord
 belongs_to :post
  belongs_to :tag
  
# PostとTagの関係を構築する際、2つの外部キーが存在することは絶対なので、バリデーションを張る。
# presence＝空でないこと
 validates :post_id, presence: true
 validates :tag_id, presence: true

end
