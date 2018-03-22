class DeliveriesController < ApplicationController

		# admin 又は user でログインしていないとアクセス出来なくするメソッド
		before_action :authenticate_user?

		# ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否するメソッド
		# before_action :ensure_correct_user, only: [:edit]

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

	# def ensure_correct_user
	# 	unless admin_signed_in? then
	# 		               # adminでsigned_inしていないときに
	# 		if @user_signed_in.id != current_user.id  # ログインuserのidと、見ようとしているページのidが一致していなければ
	# 			redirect_to root_path               # root_pathへリダイレクト
	# 		end
	# 	end
	# end

end