class TopsController < ApplicationController
	def top
	end

	def map
		@teams = Team.all
	end
end
