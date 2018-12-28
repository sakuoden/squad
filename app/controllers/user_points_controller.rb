class UserPointsController < ApplicationController
	def create
		if UserPoint.where(user_id: current_user).exists?
			@user_point = UserPoint.find_by(user_id: current_user)
			@user_point.point += 100
			@user_point.time = current_ymt
			@user_point.save
			redirect_to '/'
		else
			@user_point = current_user.user_points.new
			@user_point.point = 100
			@user_point.time = current_ymt
			@user_point.save
			redirect_to '/'
		end
	end
end
