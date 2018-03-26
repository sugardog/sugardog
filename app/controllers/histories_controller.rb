class HistoriesController < ApplicationController

	# indexの時だけadminの認証がいる
	before_action :authenticate_admin?, only: [:index, :update]

	# ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否するメソッド
	# before_action :ensure_correct_user

	def index
		@histories = History.all
	end

	def update
		history = History.find(params[:id])
		history.update(history_params)
		redirect_to histories_path
	end

	def destroy
		history = History.find(params[:id])
		history.destroy
		redirect_to user_history_path(current_user)

	end


	private

	def history_params
		params.require(:history).permit(:user_id, :delivery_id, :totol_price, :soft_destroyed_at, :status)
	end

	def authenticate_admin?
		redirect_to root_path unless  admin_signed_in?
	end

	# def ensure_correct_user
	# end
end
