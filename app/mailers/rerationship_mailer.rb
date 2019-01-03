class RerationshipMailer < ApplicationMailer

	def invite_notification(user, team)
		@user = user
		@team = team
		mail to: user.email, subject: "#{@team.team_name}から招待されています"
	end

	def Relationship.send_invite_email(user, team)
		RelationshipMailer.invite_notification(user, team).deliver_now
	end

end
