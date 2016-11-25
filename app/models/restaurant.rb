class Restaurant < ApplicationRecord

  has_many :restaurant_users
  has_many :users, through: :restaurant_users
  has_many :products
  has_many :questionnaires
end
