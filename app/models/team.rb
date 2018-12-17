class Team < ApplicationRecord
	has_many :members, dependent: :destroy
	has_many :users, through: :members

	attachment :team_image
end
