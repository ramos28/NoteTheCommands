class ProductCommandsController < ApplicationController
	def index
        @product_commands = CommandProduct.all.paginate(:per_page => 5, :page => params[:page])
        @product_command = CommandProduct.new
    end

    def create
        @product_command = CommandProduct.new(product_command_params)
        if @product_command.save
            flash[:notice] = "Successfully created product command."
            redirect_to @product_command
        else
            render :action =>'new'
        end
    end

    private

    def product_command_params
        params.require(:product_command).permit(:command_id, :product_id, :quantity)

    end 
end
