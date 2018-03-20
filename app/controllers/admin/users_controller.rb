class Admin::UsersController < ApplicationController


	before_action :authenticate_admin!, only: [:index] # indexの時だけadminの認証がいる
	before_action :admin_user?, only: [:index] # indexの時だけ'admin_user?'を呼び出す
	before_action :current_user?, except: [:index]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])

		#@deliveries = @user.deliveries.page(params[:page])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to admin_user_path(user)
	end

	def quit
		@user = User.find(params[:id])
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		if admin_signed_in?
			redirect_to admin_users_path
		else
			redirect_to cds_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :zipcode, :prefecture_id, :address, :tel, :email)
	end

	def admin_user?
		redirect_to root_path unless admin_signed_in? # adminでログインしていなければ、root_pathにリダイレクトされる
	end

	def current_user?
		redirect_to root_path unless user_signed_in? || admin_signed_in?
	end


end
# current_user.is_a?(Admin)
