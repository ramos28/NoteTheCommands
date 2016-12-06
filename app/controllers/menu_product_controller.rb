class MenuProductController < ApplicationController
    def index
        @restaurant_users = RestaurantUser.all.paginate(:per_page => 5, :page => params[:page])
        @menu_products = MenuProduct.new
    end

    def create
        @menu_product = MenuProduct.new(menu_product_params)
        @menu_product.category = MenuProduct::CONTENT_CATEGORY.index('GENERAL') if @menu_product.category.blank?
        @menu_product.save

        redirect_to root_path
    end

    private

    def product_menu_params
        params.require(:menu_product).permit(:product_id, :menu_id, :category)

    end
end
