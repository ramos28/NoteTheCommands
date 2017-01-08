class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	   :recoverable, :rememberable, :trackable, :validatable

	######Porque en este caso en vez de ser restaurants no es users???
	has_many :restaurant_users
	has_many :emails
	has_many :restaurants, through: :restaurant_users

	has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  	has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  	has_many :personal_messages, dependent: :destroy

	#Validacion de los paramtros insertados en el registro	
	validates :user_name, length: { maximum: 30 }


	def age
		 (Time.zone.now - self.birth_date.to_datetime).to_i / 1.year
	end
end