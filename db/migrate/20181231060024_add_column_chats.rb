class AddColumnChats < ActiveRecord::Migration[5.2]
  def change
  	add_column :chats, :user_id, :integer
  	add_column :chats, :chat_comment, :text
  end
end
