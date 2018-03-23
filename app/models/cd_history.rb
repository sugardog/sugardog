class CdHistory < ApplicationRecord
	belongs_to :cd
	belongs_to :history
end
