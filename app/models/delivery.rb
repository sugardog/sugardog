class Delivery < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture

	# soft_deletable dependent_associations: [:user]
end
