class CdHistoriesController < ApplicationController
	before_action :admin_user?

	def admin_user?
		redirect_to root_path unless user_signed_in? || admin_signed_in?
	end

end
