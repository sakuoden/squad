class ChangeIndivisualModelName < ActiveRecord::Migration[5.2]
  def change
  	rename_table :indivisuals, :members
  end
end
