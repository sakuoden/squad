class ChangeClumnPost < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :post_image_id, :integer
  end
end
