class Team < ApplicationRecord
	has_many :members, dependent: :destroy
	has_many :users, through: :members

	has_many :follows, dependent: :destroy
	has_many :users, through: :follows

	has_many :posts, dependent: :destroy

	has_many :chats, dependent: :destroy

	attachment :team_image
end
