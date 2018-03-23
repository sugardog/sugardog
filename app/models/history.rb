class History < ApplicationRecord

	enum status:{受付: 0,準備中: 1,発送済: 2}

	has_many :cd_histories
	has_many :cds, through: :cd_histories
	belongs_to :user
	belongs_to :delivery
end
