class DropTableChats < ActiveRecord::Migration[5.2]
  def change
  	remove_column :chats, :user_id, :integer
  	remove_column :chats, :chat_comment, :text

  end
end
