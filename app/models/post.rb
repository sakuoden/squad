class Post < ApplicationRecord
	has_many :post_favorites
	has_many :post_comments

	attachment :post_image
end
