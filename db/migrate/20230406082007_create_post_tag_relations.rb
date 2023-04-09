class CreatePostTagRelations < ActiveRecord::Migration[6.1]
  
  def change
    create_table :post_tag_relations do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
    #同じタグを投稿できない様にする記述。一旦コメントアウト
    #add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end

