class ChangeNameTeamsTeamColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :teams, :team, :team_name
  end
end
