class CreateIndivisuals < ActiveRecord::Migration[5.2]
  def change
    create_table :indivisuals do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :position

      t.timestamps
    end
  end
end
