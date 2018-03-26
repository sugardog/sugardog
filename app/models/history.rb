class History < ApplicationRecord

	# attachment :image

	enum status:{受付中: 0,準備中: 1,発送済み: 2}

	has_many :cd_histories, dependent: :destroy
	has_many :cds, through: :cd_histories
	belongs_to :user
	# belongs_to :delivery
end
