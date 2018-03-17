class Cd < ApplicationRecord
	attachment :image

	has_many :cd_genres

	belongs_to :artist
end
