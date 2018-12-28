class TopsController < ApplicationController
	def top
		@teams = Team.all
	end
end
