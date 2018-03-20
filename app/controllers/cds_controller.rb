class CdsController < ApplicationController
def index
	@cds = Cd.all
	@genres = Genre.all
	@pop_images = PopImage.all
	@cd = Cd.new
end

def show
	@cd = Cd.find(params[:id])
end

def new
	@cd_genres = CdGenre.all
	@genres = Genre.all
	@artists = Artist.all
	@cd = Cd.new
end

def create
	cd = Cd.new(cd_params)
	cd.save
	genres = params[:cd][:cd_genre][:genre_id]
	genres.each do |genre|
		cd_genre = cd.cd_genres.new
		if genre.blank?
		else
			cd_genre.genre_id = genre
			cd_genre.save
		end
	end
	redirect_to new_cd_disc_path(cd)
end

def edit
	@cd = Cd.find(params[:id])
end

def update
	cd = Cd.find(params[:id])
	cd.destroy
	redirect_to cds_path
end

def destroy
	cd = Cd.find(params[:id])
	cd_destroy
	redirect_to cds_path
end

private
def cd_params
	params.require(:cd).permit(:album_name, :album_kana_name, :image, :label, :price, :stock, :release_date, :cd_introduction, :artist_id, :campaign_id)
end

end
