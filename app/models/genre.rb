class Genre < ApplicationRecord
	belongs_to :cd, optional: true
	validates :genre_name, presence: true, length: { maximum:50}
end
