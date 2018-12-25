class AddColumnToPostComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :post_comments, :post_comment_user_id, :integer
  end
end
