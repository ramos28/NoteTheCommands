class CommandProductsController < ApplicationController
	def index
        @product_commands = CommandProduct.all.paginate(:per_page => 5, :page => params[:page])
        @product_command = CommandProduct.new
    end

    def create
        @product_command = CommandProduct.new(product_command_params)
        
        if current_user.age < 18 && !@product_command.product.younger
            flash[:notice] = "Eres menor de edad"
            redirect_to :back
        else
            if @product_command.save
                flash[:notice] = "Successfully created product command."
                redirect_to :back
            else
                render :action =>'new'
            end
        end
    end

    def destroy
        @product_command = CommandProduct.find(params[:id])

        if @product_command.destroy
            redirect_to :back
        end
    end

    private

    def product_command_params
        params.require(:command_product).permit(:command_id, :product_id, :quantity)

    end 
end
