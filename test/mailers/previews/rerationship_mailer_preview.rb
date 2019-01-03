# Preview all emails at http://localhost:3000/rails/mailers/rerationship_mailer
class RerationshipMailerPreview < ActionMailer::Preview

	def invite_notification
		user = User.first
		team = Team.first
		RerationshipMailer.invite_notification(user, team)
	end

end
