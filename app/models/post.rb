class Post < ApplicationRecord
	has_many :post_favorite_middles, dependent: :destroy

	belongs_to :user
	belongs_to :team

	has_many :post_comments, dependent: :destroy

	attachment :post_image
end
