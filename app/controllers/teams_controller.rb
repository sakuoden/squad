class TeamsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]

	def new
		@team = Team.new
	end

	def create
		@user = current_user
		@team = @user.teams.new(team_params)
		if @user.save
			flash[:notice] = "チームの作成を完了しました"
			redirect_to '/'
		end
	end

	def show
		@team = Team.find(params[:id])
		@favorites = Favorite.where(team_id: @team.id)
	end



	def member
		@team = Team.find(params[:id])
	end

	def member_new
		@team = Team.find(params[:id])
		@members = @team.members
	end

	def member_edit
		@team = Team.find(params[:id])
	end


	private
	def team_params
		params.require(:team).permit(:team_name, :team_image)
	end
end
