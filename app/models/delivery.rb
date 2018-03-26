class Delivery < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture
	# has_many :histories
end
