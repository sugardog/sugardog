class AdminsController < ApplicationController

	before_action :authenticate_admin!

	def index
		@cds = Cd.all
	end

end
