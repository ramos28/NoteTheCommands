class CommandMenusController < ApplicationController
	def index
        @menu_commands = CommandMenu.all.paginate(:per_page => 5, :page => params[:page])
        @menu_command = CommandMenu.new
    end

    def create
        @menu_command = CommandMenu.new(menu_command_params)
        if @menu_command.save
            flash[:notice] = "Successfully created menu command."
            redirect_to :back
        else
            render :action =>'new'
        end
    end

    private

    def menu_command_params
        params.require(:command_menu).permit(:command_id, :menu_id, :quantity)

    end 
end
