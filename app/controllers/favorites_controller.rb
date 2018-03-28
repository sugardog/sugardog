class FavoritesController < ApplicationController

	before_action :authenticate_user!
	
	def create
		artist = Artist.find(params[:artist_id])
		favorite = current_user.favorites.new(artist_id: artist.id)
		favorite.save
		redirect_to artist_path(artist)
	end

	def destroy
		artist = Artist.find(params[:artist_id])
		favorite = current_user.favorites.find_by(artist_id: params[:artist_id])
		favorite.destroy
		redirect_to artist_path(artist)
	end

	def favorite
		@user = User.find(params[:id])
	
	end
end

