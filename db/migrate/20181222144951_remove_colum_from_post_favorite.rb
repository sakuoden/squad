class RemoveColumFromPostFavorite < ActiveRecord::Migration[5.2]
  def change
  	remove_column :post_favorites, :post_id, :integer
  	remove_column :post_favorites, :post_favorite, :integer
  end
end
