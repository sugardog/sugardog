class Disc < ApplicationRecord

	has_many :songs
	belongs_to :cd
end
