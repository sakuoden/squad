class AddColumnToPostFavorites < ActiveRecord::Migration[5.2]
  def change
  	add_column :post_favorites, :post_favorite_user, :integer
  end
end
