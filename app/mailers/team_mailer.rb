class TeamMailer < ApplicationMailer
	def invite_notification(user, team)
		@user = user
		@team = team
		mail to: @user.email,
			subject: "#{@team.team_name}から招待されています"
	end

end
