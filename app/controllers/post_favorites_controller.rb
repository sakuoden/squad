class PostFavoritesController < ApplicationController
	def create
		@post = @post.find(params[:post_id])
		@post.postfavorites.new(post_favorite_user: current_user.id)
		@post.save

	end
end
