class PostFavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		if PostFavorite.where(post_favorite_user: current_user.id).exists
			@post_favorite = PostFavorite.find_by(post_favorite_user: current_user.id)
			@post_favorite_middle = PostFavoriteMiddle.new(post_id: @post.id, post_favorite_id: @post_favorite.id)
			@post_favorite_middle.save
		else
			@post.post_favorites.new(post_favorite_user: current_user.id)
			@post.save
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post_favorite = PostFavorite.find_by(post_favorite_user: current_user.id)
		@post_favorite_middles = PostFavoriteMiddle.where(post_id: @post.id)
		@post_favorite_middle = @post_favorite_middles.find_by(post_favorite_id: @post_favorite.id)
		@post_favorite_middle.destroy
	end
end
