class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.integer :post_image_id
      t.text :post_content
      t.timestamps
    end
  end
end
