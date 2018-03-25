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
		@history.save
		@cc = @user.cart.cd_carts
		@cc.each do |cc|
			cc.cd.update(stock: cc.cd.stock - cc.count)
		end
		@user.cart.cd_carts.delete_all
		redirect_to cds_path
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