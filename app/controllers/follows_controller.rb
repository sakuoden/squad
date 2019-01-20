class FollowsController < ApplicationController
	before_action :authenticate_user!
	def create
		@team = Team.find(params[:team_id])
		@team.follows.new(user_id: current_user.id)
		@team.save
	end

	def destroy
		@team = Team.find(params[:id])
		@destroy_user = @team.follows.find_by(user_id: current_user.id)
		@destroy_user.destroy
	end
end
