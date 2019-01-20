class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:invitation][:user_id])
    team = Team.find(params[:invitation][:team_id])
    member = Member.where(team_id: team.id)

    if member.where(user_id: user.id).exists?
      flash[:invite_notice] = "すでにメンバーです"
      redirect_to "/teams/#{team.id}/member/new"

    elsif Invitation.where(user_id: user.id).exists?

        if Invitation.where(team_id: team.id).exists?
          flash[:invite_notice] = "すでに招待中です"
          redirect_to "/teams/#{team.id}/member/new"
        else
          invitation = Invitation.new(invitation_params)
          invitation.save
          flash[:invite_notice] = "チームへの招待が完了しました"
          redirect_to "/teams/#{team.id}/member/new"
        end

    else

      invitation = Invitation.new(invitation_params)
      invitation.save
      flash[:invite_notice] = "チームへの招待が完了しました"
      redirect_to "/teams/#{team.id}/member/new"

    end
  end

  def destroy
    user = current_user
    team = Team.find(params[:id])

    invitations = Invitation.where(team_id: team.id)
    invitation = invitations.find_by(user_id: user.id)
    invitation.destroy

  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :team_id)
  end
end
