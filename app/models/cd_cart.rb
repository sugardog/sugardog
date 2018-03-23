class CdCart < ApplicationRecord
		belongs_to :cart
		belongs_to :cd
end
