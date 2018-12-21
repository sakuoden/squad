class Post < ApplicationRecord
	belongs_to :member
	has_many :post_favorites
	has_many :post_comments

	attachment :post_image
end
