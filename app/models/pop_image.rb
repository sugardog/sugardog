class PopImage < ApplicationRecord
	attachment :image

	validates :image, presence: true
end
