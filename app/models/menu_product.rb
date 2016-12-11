class MenuProduct < ApplicationRecord
	belongs_to :menu
	belongs_to :product

	CONTENT_CATEGORY = ["ENTRANTE", "PRIMER PLATO", "SEGUNDO PLATO", "POSTRE", "BEBIDA"]
end
