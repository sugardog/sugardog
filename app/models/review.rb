class Review < ApplicationRecord
	belongs_to :user
	belongs_to :cd
	attachment :image
end
