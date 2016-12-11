class CommandProduct < ApplicationRecord
	belongs_to :command
	belongs_to :product
end
