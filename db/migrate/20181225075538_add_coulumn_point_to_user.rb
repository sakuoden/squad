class AddCoulumnPointToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :user_point_id, :integer
  end
end
