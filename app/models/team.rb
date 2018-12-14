class Team < ApplicationRecord
	has_many :indivisuals, dependent: :destroy
	has_many :users, through: :indivisuals

	attachment :team_image
end
