class Blog < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	has_many :blog_user
end
