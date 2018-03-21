class PrefecturesController < ApplicationController

	before_action :authenticate_admin!

	def index
		@prefectures = Prefecture.all
		@prefecture = Prefecture.new
	end

	def edit
		@prefecture = Prefecture.find(params[:id])
	end

	def create
		prefecture = Prefecture.new(prefecture_params)
		prefecture.save
		redirect_to prefectures_path
	end

	def update
		prefecture = Prefecture.find(params[:id])
		prefecture.update(prefecture_params)
		redirect_to prefectures_path
	end

	def destroy
		@prefecture = Prefecture.find(params[:id])
		@prefecture.destroy
		redirect_to prefectures_path
	end

	private

	def prefecture_params
		params.require(:prefecture).permit(:prefecture_name, :postage)
	end
end
