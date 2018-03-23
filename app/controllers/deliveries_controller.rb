class DeliveriesController < ApplicationController

		# admin 又は user でログインしていないとアクセス出来なくするメソッド
		before_action :authenticate_user?

		# newページでadmin側が見ると、userのidが取れなくなりエラーになるので、しょうがなくnewアクションだけリダイレクトさせる
		before_action :authenticate_admin?, only: [:new]

		# ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否するメソッド
		before_action :ensure_correct_user, only: [:edit]

	def new
		@delivery = Delivery.new
	end

	def create
		delivery = Delivery.new(delivery_params)
		delivery.user_id = current_user.id
		delivery.save
		redirect_to admin_user_path(current_user.id)
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		delivery = Delivery.find(params[:id])
		delivery.update(delivery_params)
		redirect_to admin_user_path(current_user.id)
	end

	def destroy
		delivery = Delivery.find(params[:id])
		delivery.destroy
		redirect_to admin_user_path(current_user)
	end

	private

	def delivery_params
		params.require(:delivery).permit(:prefecture_id, :address, :zipcode, :name, :tel, :user_id)
	end

	# admin又はuserでログインしていなければ、deliveryのページは見れないようにする
	def authenticate_user?
		redirect_to root_path unless user_signed_in? || admin_signed_in?
	end

	def authenticate_admin?
		if admin_signed_in?
			redirect_to admin_users_path
		end
	end

	def ensure_correct_user
		@delivery = Delivery.find_by(id:params[:id])
		if Delivery.exists?(params[:id])							 # Deliveryのレコードが存在しているかどうか、".exist?()"でチェックしている
			unless admin_signed_in? then  							 # adminでsigned_inしていないときに
				if @delivery.user_id != @current_user.id 			 # ログインuserのidと、見ようとしているページのuser_idが一致していなければ
					redirect_to admin_user_path(current_user.id)	 # mymenuページへリダイレクト
				end
			end
		else
			redirect_to root_path									 # Deliveryのレコードが存在していなければ（又は削除されていたら）、topページへリダイレクト
		end
	end

end