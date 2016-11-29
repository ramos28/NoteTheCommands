class ProductMenusController < ApplicationController
    def index
        @restaurant_users = RestaurantUser.all
        @products_menus = MenuProduct.new
    end

    def create
        @product_menu = MenuProduct.new(product_menu_params)
        @product_menu.category = MenuProduct::CONTENT_CATEGORY.index('ENTRANTE')
        @product_menu.save

        redirect_to root_path
    end



    private

    def product_menu_params
        params.require(:product_menu).permit(:product_id, :menu_id, :category)

    end
end
