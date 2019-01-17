class TeamsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def new
		@user = current_user
		@team = current_user.teams.new
	end

	def create
		@user = current_user
		@team = @user.teams.new(team_params)
		if @user.save
			@member = Member.new(user_id: @user.id, team_id: @team.id)
			@member.save
			redirect_to "/teams/#{@team.id}"
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

		@favorites = Favorite.where(team_id: @team.id)


		@posts = Post.where(team_id: @team.id)
		@post_favorite = PostFavorite.find_by(post_favorite_user: current_user.id)

		@post_comment = PostComment.new

		@post_favorite_middles = PostFavoriteMiddle.all
	end


	def member_new
		@team = Team.find(params[:id])
		@member = Member.new

		search = params[:search]

		if search == nil
		elsif search == ""
			flash[:notice] = "名前を入力してください。"
		elsif User.where(['name Like?', "%#{search}%"]).exists?
			@results = User.where(['name Like?', "%#{search}%"])
			@member = Member.new
		else
			flash[:notice] = "検索されたユーザーは存在しません"
		end


	end

	def member_create
		@team = Team.find(params[:id])
		@user = User.find(params[:member][:user_id])


		# if @team.members.where(user_id: @user.id).exists?
		# else
		# TeamMailer.invite_notification(@user, @team).deliver
		# end

		redirect_to "/teams/#{@team.id}/member"
	end

	def invite
	end

	def show_add_post
		@team = Team.find(params[:id])
		@favorites = Favorite.where(team_id: @team.id)


		@posts = Post.where(team_id: @team.id)
		@post_favorite = PostFavorite.find_by(post_favorite_user: current_user.id)

		@post_comment = PostComment.new

		@post_favorite_middles = PostFavoriteMiddle.all
	end


	private
	def team_params
		params.require(:team).permit(:team_name, :team_image, :place)
	end

	def member_position_params
		params.require(:member).permit(:position, :introduction)
	end

end
