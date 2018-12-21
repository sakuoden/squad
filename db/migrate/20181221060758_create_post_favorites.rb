class CreatePostFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :post_favorites do |t|
      t.integer :post_id
      t.integer :post_favorite
      t.timestamps
    end
  end
end
