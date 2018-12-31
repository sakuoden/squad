class Chat < ApplicationRecord
	belongs_to :team
	belongs_to :user

	has_many :notes, dependent: :destroy
end
