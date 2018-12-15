class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:mypage, :mypage_edit, :mypage_update]

	def mypage
	end

	def mypage_edit
		@user = User.find(current_user.id)
	end

	def mypage_update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:notice] = "変更の保存を完了しました"
			redirect_to user_edit_path
		else
			flash[:notice] = "変更の保存を失敗しました"
			render 'users/mypage_edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:image, :name, :email)
	end

end
