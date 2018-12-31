class ChatsController < ApplicationController
	def show
		@team = Team.find(params[:id])
		@chats = Chat.where(team_id: @team.id)
	end
end
