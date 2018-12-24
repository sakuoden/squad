class PostFavorite < ApplicationRecord
	has_many :post_favorite_middles, dependent: :destroy
	has_many :posts, through: :post_favorite_middles
end
