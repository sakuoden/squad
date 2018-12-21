class Member < ApplicationRecord
	belongs_to :user
	belongs_to :team
	has_many :posts
end
