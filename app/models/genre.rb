class Genre < ApplicationRecord
	attachment :image
	has_many :cd_genres
	validates :genre_name, presence: true, length: { maximum:50}
end
