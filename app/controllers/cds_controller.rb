class CdsController < ApplicationController

def about_us
	
end

def index
	@cds = Cd.all
	@genres = Genre.all
	@pop_images = PopImage.all
	@cd = Cd.new
	@rankings = Ranking.order("rank asc")
	# @q = Cd.eager_load(artist: :artist_name).ransack(params[:q])
	# if params[:album_name].present?
	# 	@cds = @cds.get_by_album_name params[:album_name]
	# 	render 'search'
	# end
	# if params[:articst_name].present?
	# 	@cds = @cds.artist.get_by_artist_artist_name params[:artist_name]
	# 	render 'serach'
	# end
end

def show
	@cd = Cd.find(params[:id])
	@cd_cart = CdCart.new
	 # params[:id].present?


	# @songs = @cd.discs.songs(params[:song])
end



# def search
# 	@cds = @cds.get_by_album_name params[:album_name]
# 	@cds = @cds.artist.get_by_artist_name params[:artist_name]
# end

def search
	@q = Cd.ransack(params[:q])
	@cds = @q.result
end

def new
	@cd_genres = CdGenre.all
	@genres = Genre.all
	@artists = Artist.all

	if params[:id].present?
		@cd = Cd.find(params[:id]) 

	else @cd = Cd.new
	end
end

def create
	@cd = Cd.new(cd_params)
	if @cd.save
		genres = params[:cd][:cd_genre][:genre_id]
		genres.each do |genre|
			cd_genre = @cd.cd_genres.new
			unless genre.blank?
				cd_genre.genre_id = genre
				cd_genre.save
			end
		end
		redirect_to new_cd_disc_path(@cd)
	else
		render :new
	end
end

def edit
	@cd = Cd.find(params[:id])
end

def update
	cd = Cd.find(params[:id])
	cd.update(cd_params)
	redirect_to cds_path
end

def destroy
	cd = Cd.find(params[:id])
	cd.destroy
	redirect_to cds_path
end

private
def cd_params
	params.require(:cd).permit(:album_name, :album_kana_name, :image, :label, :price, :stock, :release_date, :cd_introduction, :artist_id, :campaign_id)
end

end
