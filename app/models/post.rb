class Post < ApplicationRecord
	has_many :post_favorite_middles, dependent: :destroy
	has_many :post_favorites, through: :post_favorite_middles


	belongs_to :user
	belongs_to :team

	attachment :post_image
end
