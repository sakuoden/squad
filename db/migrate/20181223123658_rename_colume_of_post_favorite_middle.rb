class RenameColumeOfPostFavoriteMiddle < ActiveRecord::Migration[5.2]
  def change
  	rename_column :post_favorite_middles, :post_favorite_middle, :post_favorite_id
  end
end
