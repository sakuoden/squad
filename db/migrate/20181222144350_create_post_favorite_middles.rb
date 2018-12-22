class CreatePostFavoriteMiddles < ActiveRecord::Migration[5.2]
  def change
    create_table :post_favorite_middles do |t|
      t.integer :post_id
      t.integer :post_favorite_middle
      t.timestamps
    end
  end
end
