class ChatsController < ApplicationController
	def show
		@team = Team.find(params[:id])

		@chat = Chat.new

# https://qiita.com/yuki-n/items/885f6f059167a7b5aedcを参考にしたリアルタイムチャット機能。時間が無いので断念。
		# respond_to do |format|
		# 	format.html
		# 	format.json { @new_chat = Chat.where('id > ?', params[:chat][:id])}
		# end
	end

	def create
		@team = Team.find(params[:chat][:team])

		@chat = @team.chats.new(chat_params)
		@chat.user_id = current_user.id
		@chat.save
		redirect_to chat_path(@team.id)
	end


	private
	def chat_params
		params.require(:chat).permit(:chat_comment)
	end
end
