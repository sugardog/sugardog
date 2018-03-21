class Admin::UsersController < ApplicationController

	# indexの時だけadminの認証がいる
	before_action :authenticate_admin!, only: [:index]

	# indexの時だけ'admin_user?'を呼び出す
	before_action :admin_user?, only: [:index]

	# index以外のページをログインuserが見れるようにする
	before_action :current_user?, except: [:index]

	# ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否するメソッド
	before_action :ensure_correct_user, only: [:show, :edit]

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

	# adminでログインしていなければ、root_pathにリダイレクトされる
	def admin_user?
		redirect_to root_path unless admin_signed_in? # current_user.is_a?(Admin)
	end

	# admin又はuserでログインしていなければ、userのページは見れないようにする
	def current_user?
		redirect_to root_path unless user_signed_in? || admin_signed_in?
	end

	def ensure_correct_user
		unless admin_signed_in? then                # adminでsigned_inしていないときに
			if current_user.id != params[:id].to_i  # ログインuserのidと、見ようとしているページのidが一致していなければ
				redirect_to root_path               # root_pathへリダイレクト
			end
		end
	end


end
