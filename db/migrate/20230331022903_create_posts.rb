class CreatePosts < ActiveRecord::Migration[6.1]
  
  def change
    create_table :posts do |t|
      t.integer :user_id,         null: false
      t.text :item_name,          null: false
      t.text :item_description,   null: false
      t.timestamps
    end
  end
end


