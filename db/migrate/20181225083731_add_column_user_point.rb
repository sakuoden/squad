class AddColumnUserPoint < ActiveRecord::Migration[5.2]
  def change
  	add_column :user_points, :user_id, :integer
  end
end
