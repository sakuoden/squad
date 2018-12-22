class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def changer
  	add_column :posts, :user_id, :integer
  end
end
