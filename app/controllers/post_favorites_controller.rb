class PostFavoritesController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@post.post_favorite_middles.new(post_favorite_id: current_user.id)
		@post.save
	end

	def destroy
		@post = Post.find(params[:id])
		@post.post_favorite_middles.find_by(post_favorite_id: current_user.id)
		@post.destroy
	end
end
