class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team
      t.string :team_image_id
      t.boolean :notification

      t.timestamps
    end
  end
end
