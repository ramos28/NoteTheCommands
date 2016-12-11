class MenuCommandsController < ApplicationController
	def index
        @menu_commands = CommandMenu.all.paginate(:per_page => 5, :page => params[:page])
        @menus_commands = CommandMenu.new
    end

    def create
        @menu_command = CommandMenu.new(menu_command_params)
        if @menu_command.save
            flash[:notice] = "Successfully created menu command."
            redirect_to @menu_command
        else
            render :action =>'new'
        end
    end

    private

    def menu_command_params
        params.require(:menu_command).permit(:command_id, :menu_id, :quantity)

    end 
end
