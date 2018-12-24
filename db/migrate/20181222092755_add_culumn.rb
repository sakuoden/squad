class AddCulumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :team_id, :integer
  end
end
