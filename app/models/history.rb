class History < ApplicationRecord
	has_many :cd_histories
	has_many :cds, through: :cd_histories
	belongs_to :user
	belongs_to :delivery
end
