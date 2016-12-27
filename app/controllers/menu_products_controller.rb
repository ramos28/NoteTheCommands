class MenuProductsController < ApplicationController
    def index
        @menu_products = MenuProduct.all.paginate(:per_page => 5, :page => params[:page])
        @menus_products = MenuProduct.new
    end

    def create
        @menu_product = MenuProduct.new(menu_product_params)
        if @menu_product.save
            flash[:notice] = "Successfully created product_menu."
            redirect_to :back
        else
            render :action =>'new'
        end
    end

    private

    def menu_product_params
        params.require(:menu_product).permit(:product_id, :menu_id, :category)

    end
end
