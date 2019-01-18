class RenameColumnMemberTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :member, :position, :member_status
  end
end
