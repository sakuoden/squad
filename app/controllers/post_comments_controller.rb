class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@post_comment = PostComment.new(post_comment_params)
  	@post_comment.post_id = params[:post_comment][:post_id]
  	@post_comment.post_comment_user_id = current_user.id
  	@post_comment.save

  	@post = Post.find(params[:post_comment][:post_id])
  end

  private
  def post_comment_params
  	params.require(:post_comment).permit(:post_comment)
  end
end
