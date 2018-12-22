class Post < ApplicationRecord
	has_many :post_favorites
	has_many :post_comments

	belongs_to :user
	belongs_to :team

	attachment :post_image
end
