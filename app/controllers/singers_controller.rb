class SingersController < ApplicationController
	before_action :authenticate_admin!
end
