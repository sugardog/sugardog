class UsersController < ApplicationController

	before_action :authenticate_admin!
	before_action :authenticate_user! , only: [:show, :edit, :update, :quit, :destroy]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@admin = Admin.find(params[:id])
		#@deliveries = @user.deliveries.page(params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

	def quit
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to cds_path
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :zipcode, :prefecture_id, :address, :tel, :email)
	end

end
