class ProductTakeawaysController < ApplicationController
	def index
        @product_takeaways = TakeawayProduct.all.paginate(:per_page => 5, :page => params[:page])
        @product_takeaway = TakeawayProduct.new
    end

    def create
        @product_takeaway = TakeawayProduct.new(product_takeaway_params)
        if @product_takeaway.save
            flash[:notice] = "Successfully created product takeaway."
            redirect_to @product_takeaway
        else
            render :action =>'new'
        end
    end

    private

    def product_takeaway_params
        params.require(:product_takeaway).permit(:takeaway_id, :product_id, :quantity)

    end 
end