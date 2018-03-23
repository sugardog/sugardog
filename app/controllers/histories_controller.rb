class HistoriesController < ApplicationController
	def index
		@genres = Genre.all
	end
end
