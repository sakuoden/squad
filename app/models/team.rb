class Team < ApplicationRecord
	has_many :members, dependent: :destroy
	has_many :users, through: :members

	has_many :posts, dependent: :destroy

	attachment :team_image
end
