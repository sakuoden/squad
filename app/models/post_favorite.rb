class PostFavorite < ApplicationRecord
	has_many :posts, through: :post_favorite_middles
	has_many :post_favorite_middles, dependent: :destroy
end
