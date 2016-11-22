class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	   :recoverable, :rememberable, :trackable, :validatable

	######Porque en este caso en vez de ser restaurants no es users???
	has_many :restaurant_users
	has_many :restaurants, through: :restaurant_users

	#Validacion de los paramtros insertados en el registro	
	validates :user_name, length: { maximum: 30 }
end