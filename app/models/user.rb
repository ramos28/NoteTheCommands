class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurant_users
  has_many :restaurants, through: :restaurant_users

  validates :nick, format: {with: /[^{}]/}
  validates :nick, length: { in: 8..20 }
  validates :username, length: { maximum: 30 }
end