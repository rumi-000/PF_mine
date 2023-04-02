class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      #ここから記載
      #t.integer :tag_id
      t.integer :item_name,      null:false
      t.text:item_description,   null:false
      #ここまで記載
      t.timestamps
    end
  end
end




