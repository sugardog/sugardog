class UsersController < ApplicationController

	before_action :authenticate_user!

	def quit
		@user = current_user
	end

	def history
		@user = current_user
	end

	# def destroy
	# 	user = User.find(params[:id])
	# 	user.destroy
	# 	if admin_signed_in?
	# 		redirect_to users_path
	# 	else
	# 		redirect_to cds_path
	# 	end
	# end

end
