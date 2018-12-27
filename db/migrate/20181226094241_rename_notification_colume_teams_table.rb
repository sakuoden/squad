class RenameNotificationColumeTeamsTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :notification, :boolean
  end
end