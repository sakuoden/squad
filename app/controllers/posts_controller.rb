class PostsController < ApplicationController
  def new
  	@team = Team.find(params[:team_id])
  	@members = Member.where(team_id: @team.id)
  	@member = @members.find_by(user_id: current_user.id)

  	@post = Post.new
  end

  def create
  	@post = Post.new(member_params)

  	@team = Team.find(params[:post][:team_id])

  	@post.team_id = @team.id
  	@post.user_id = current_user.id

  	if @post.save
  		redirect_to team_path(@team.id)
  	else
	  	@members = Member.where(team_id: @team.id)
  		render 'posts/new'
  	end

  end

  def index
  end


private

  def member_params
  	params.require(:post).permit(:post_image, :post_content)
  end


end
