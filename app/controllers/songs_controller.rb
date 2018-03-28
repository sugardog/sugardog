class SongsController < ApplicationController

	# adminの認証
	before_action :authenticate_admin?

	def new
		@cd = Cd.find(params[:cd_id])
		@song = Song.new
		@disc = @cd.discs.new
	end

	def create
		@disc = Disc.new(disc_params)
		@song = Song.new(song_params)
		binding.pry
		@disc.save
		@song.save
		redirect_to cds_path
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def song_params
		params.require(:song).permit(:song_name, :song_kana_name, :order_num, :minutes, :disc_id, :singer_id)
		
	end

def disc_params
	params.require(:disc).permit(:disc_num)
	

end

	# adminでログインしていなければ、root_pathにリダイレクトされる
	def authenticate_admin?
		redirect_to root_path unless admin_signed_in?
	end

end
