class PostsController < ApplicationController
  def new
  	@members = Member.where(team_id: params[:team_id])
  	@member = @members.find_by(user_id: current_user.id)

  	@post = Post.new
  end

  def create
  	@post = Post.new(member_params)

  	@member = Member.find(params[:post][:member_id])

  	@post.member_id = @member.id

  	@team = @member.team

  	if @post.save
  		redirect_to team_path(@team.id)
  	else
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
