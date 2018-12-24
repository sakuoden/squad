class PostFavoriteMiddle < ApplicationRecord
	belongs_to :post
	belongs_to :post_favorite
end
