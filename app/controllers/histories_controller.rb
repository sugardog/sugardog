class HistoriesController < ApplicationController

	before_action :authenticate_user?
	before_action :ensure_correct_user

	def index
		@histories = History.all
	end

	def show
		
	end

	def destroy
	end

	private
	def authenticate_user?
	end

	def ensure_correct_user
	end
end
