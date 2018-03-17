class CdsController < ApplicationController
def index
	@cds = Cd.all
	@genres = Genre.all
	@pop_images = PopImage.all
	@cd = Cd.new
end

def show
	@cd = Cd.find(params[:id])
	@cd_genres = CdGenre.all
	@genre = Genre.find(params[:id])
	@artist = Artist.find(params[:id])
end

def new
	@cd = Cd.new
end

def create
	cds = Cd.all
	cd = Cd.new(cd_params)
	cd.save
	redirect_to cds_path
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
