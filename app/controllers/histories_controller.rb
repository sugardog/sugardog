class HistoriesController < ApplicationController

	# indexの時だけadminの認証がいる
	before_action :authenticate_admin?, only: [:index, :update]

	# index以外のページをログインuserが見れるようにする
	before_action :authenticate_user?, except: [:index, :update]

	def index
		@histories = History.all
	end

	def update
		history = History.find(params[:id])
		history.update(history_params)
		redirect_to histories_path
	end

	def create
		@user = User.find(current_user[:id])
		@history = History.new(history_params)
		@cc = @user.cart.cd_carts
		@cc.each do |cc|

			if  cc.cd.stock - cc.count <= -1
				return redirect_to cart_path(@user.cart),flash: {notice: '大変申し訳ございません。売り切れの商品がございます。'}
			else
				@history.save
				cc.cd.update(stock: cc.cd.stock - cc.count)
				@user.cart.cd_carts.delete_all
			end
		end

		redirect_to cds_path, flash: {thank: 'お買い上げありがとうございます。'}
	end

	def destroy
		history = History.find(params[:id])
		history.soft_destroy
		redirect_to user_history_path(current_user)

	end


	private

	def authenticate_admin?
		redirect_to root_path unless  admin_signed_in?
	end

	# admin又はuserでログインしていなければ、ページは見れないようにする
	def authenticate_user?
		redirect_to root_path unless  user_signed_in? || admin_signed_in?
	end

	def history_params
		params.require(:history).permit(:total_price, :prefecture_id, :zipcode, :address, :tel, :name, :user_id, :status,
			cd_histories_attributes: [:id, :history_id, :cd_id, :count, :last_price])
	end

end

