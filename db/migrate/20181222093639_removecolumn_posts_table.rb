class RemovecolumnPostsTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :posts, :member_id, :integer
  end
end
