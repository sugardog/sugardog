class Cd < ApplicationRecord
	attachment :image
	has_many :discs
	has_many :cd_genres
	has_many :genres, through: :cd_genres
	belongs_to :artist

end
