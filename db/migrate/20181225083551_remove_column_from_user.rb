class RemoveColumnFromUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :user_point_id, :integer
  end
end
