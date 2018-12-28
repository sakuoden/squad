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


		@posts = Post.where(team_id: @team.id)
		@post_favorite = PostFavorite.find_by(post_favorite_user: current_user.id)

		@post_comment = PostComment.new

		@post_favorite_middles = PostFavoriteMiddle.all
	end


	def member
		@team = Team.find(params[:id])
	end

	def member_new
		@team = Team.find(params[:id])
		@members = @team.members


		@result = params[:result]
		if @result
			if User.where(['name Like?', "%#{@result}%"]).exists?
				@users = User.where(['name Like?', "%#{@result}%"])
			else
				@users = "ユーザーは存在しません"
			end
		elsif @result == ""
			@users = User.all
		else
			@users = nil
		end

		# ラジオボタンでやるので、選択式は諦める
		# number = params[:value].to_i
		# users = @users
		# member_user = users[number]
	end

	def member_create
		member = Member.new
		member.user_id = params[:member]
		member.team_id = params[:id]
		member.save
		# リダイレクトせずひとまずここまで後でやる

	end

	def member_edit
		@team = Team.find(params[:team_id])
		@user = User.find(params[:user_id])

		@members = Member.where(team_id: @team.id)
		@member = @members.find_by(user_id: @user.id)
	end

	def member_update
		team = Team.find(params[:member][:team_id])
		user = User.find(params[:member][:user_id])

		members = Member.where(team_id: team.id)
		member = members.find_by(user_id: user.id)

		if member.update!(member_position_params)
			redirect_to "/teams/#{team.id}/member"
		else
			render 'teams/member_edit'
		end
	end


	private
	def team_params
		params.require(:team).permit(:team_name, :team_image)
	end

	def member_position_params
		params.require(:member).permit(:position, :introduction)
	end

end
