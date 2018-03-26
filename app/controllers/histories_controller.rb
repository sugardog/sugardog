class HistoriesController < ApplicationController

	before_action :authenticate_user?
	before_action :ensure_correct_user

	def index
		@histories = History.all
    	@genres = Genre.all
	end

	def show
		
	end
	def create
		@user = User.find(current_user[:id])
		@history = History.new(history_params)
		@cc = @user.cart.cd_carts
		@cc.each do |cc|

			if  cc.cd.stock - cc.count <= 0
				return redirect_to cart_path(@user.cart),flash: {notice: '大変申し訳ございません。売り切れの商品がございます。'}
			else
				@history.save
				cc.cd.update(stock: cc.cd.stock - cc.count)
				@user.cart.cd_carts.delete_all
				return redirect_to cds_path, flash: {notice: 'お買い上げありがとうございます。'}
			end
		end
	end

	def destroy
	end

	private
	def authenticate_user?
	end

	def ensure_correct_user
	end

private

	def history_params
		params.require(:history).permit(:total_price, :prefecture_id, :zipcode, :address, :tel, :name, :user_id, :status,
			cd_histories_attributes: [:id, :history_id, :cd_id, :count, :last_price])
	end

end