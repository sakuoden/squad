class ChangeTeamsTableNotificationColumnFromBooleanToInteger < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :invited_team_id, :integer
  end
end
