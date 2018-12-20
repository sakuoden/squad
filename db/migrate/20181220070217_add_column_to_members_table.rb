class AddColumnToMembersTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :members, :approval, :boolean
  end
end
