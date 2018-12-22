class Post < ApplicationRecord
	has_many :post_favorites
	has_many :post_comments

	belongs_to :user_id
	belongs_to :team_id

	attachment :post_image
end
