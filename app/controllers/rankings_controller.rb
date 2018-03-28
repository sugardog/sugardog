class RankingsController < ApplicationController

  before_action :authenticate_admin?

  def index
  	@cds = Cd.all
  	@rankings = Ranking.all
  	@ranking = Ranking.new
  end

def create
	@rankings = Ranking.all
	@ranking = Ranking.new(ranking_params)
	if 	@ranking.save
		redirect_to rankings_path
	else
		render :index
	end
end

def destroy
	@ranking = Ranking.find(params[:id])
	@ranking.destroy
	redirect_to rankings_path
end

private
	def ranking_params
		params.require(:ranking).permit(:cd_id, :id, :rank)
	end

	def authenticate_admin?
		redirect_to root_path unless admin_signed_in?
	end
end
