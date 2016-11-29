class MenuProduct < ApplicationRecord
	belongs_to :menu
	belongs_to :product

	CONTENT_CATEGORY = ["ENTRANTE", "PRIMER_PLATO", "SEGUNDO_PLATO", "POSTRE", "BEBIDA"]
end
