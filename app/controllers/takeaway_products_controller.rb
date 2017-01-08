class TakeawayProductsController < ApplicationController
	def index
        @takeaway_products = TakeawayProduct.all.paginate(:per_page => 5, :page => params[:page])
        @takeaways_products = TakeawayProduct.new
    end

    def create
        @takeaway_product = TakeawayProduct.new(takeaway_product_params)
        debugger
        if @takeaway_product.save
            flash[:notice] = "Successfully created takeaway_product."
            redirect_to :back
        else
            render :action =>'new'
        end
    end

    private

    def takeaway_product_params
        params.require(:takeaway_product).permit(:product_id, :takeaway_id, :quantity)

    end
end
