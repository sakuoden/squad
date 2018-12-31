class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :chat_id
      t.string :note_title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
