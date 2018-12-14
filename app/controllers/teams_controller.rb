class TeamsController < ApplicationController

	def new
		@team = Team.new
	end

	def create
		@team = current_user.teams.new(team_params)
		if @team.save
			flash[:notice] = "チームの作成を完了しました"
			redirect_to '/'
		end
	end

	def show
	end

	def member
	end


	private
	def team_params
		params.require(:team).permit(:team, :team_image)
	end
end
