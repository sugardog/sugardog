class DiscsController < ApplicationController

	def new
		@cd = Cd.find(params[:cd_id])
		@disc = Disc.new
		@song = Song.new
	end

	def create
		@cd = Cd.find(params[:cd_id])
		@disc = Disc.new(disc_params)
		@song = Song.new(song_params)
		@disc.cd_id = @cd.id
		@disc.save
		@song.disc_id = @disc.id
		@song.save
		redirect_to cds_path
		
	end

	def destroy
		
	end

private
def disc_params
	params.require(:disc).permit(:cd_id, :disc_num)
	
end
	def song_params
		params.require(:song).permit(:song_name, :song_kana_name, :order_num, :minutes, :disc_id, :singer_id)
		
	end
end
