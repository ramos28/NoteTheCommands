class ConversationsController < ApplicationController
	before_action :set_conversation, except: [:index]
	before_action :check_participating!, except: [:index]

	def index
		@conversations = Conversation.participating(current_user).order('updated_at DESC').paginate(:per_page => 5, :page => params[:page])
		@users = User.all.paginate(:per_page => 20, :page => params[:page])
	end

	def show
		@conversation = Conversation.find_by(id: params[:id])
		@personal_message = PersonalMessage.new
	end

	private

	def set_conversation
		@conversation = Conversation.find_by(id: params[:id])
	end

	def check_participating!
		redirect_to root_path unless @conversation && @conversation.participates?(current_user)
	end
end
