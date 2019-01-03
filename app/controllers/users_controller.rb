class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update]

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:notice] = "変更の保存を完了しました"
			redirect_to edit_user_path(@user.id
				)
		else
			flash[:notice] = "変更の保存を失敗しました"
			render 'users/edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@post_comment = PostComment.new
	end

	def follow
		@user = User.find(params[:id])
	end

	def belong
		@user = User.find(params[:id])
	end


	private
	def user_params
		params.require(:user).permit(:image, :name, :email)
	end

end
