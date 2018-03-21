class Cd < ApplicationRecord
	attachment :image
	has_many :discs
	has_many :cd_genres
	has_many :genres, through: :cd_genres
	belongs_to :artist
	has_many :cd_carts
	has_many :carts, through: :cd_carts


	validates :album_name, :album_kana_name, :label, :price, :stock, :release_date, :artist_id, presence: true


	# scope :get_by_album_name, -> (album_name) {
	# 	where("album_name like ?", "%#{album_name}%")
	# }
	# scope :get_by_artist_name, -> (artist_name) {
	# 	where("artist_name like ?", "%#{artist_name}%")
	# }
end
