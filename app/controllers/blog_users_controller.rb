class BlogUsersController < ApplicationController
    def create

        @blog_user = BlogUser.new(blog_user_params)
        if @blog_user.save
            flash[:notice] = "Successfully created product_menu."
            redirect_to :back
        else
            render :action =>'new'
        end
    end

    private

    def blog_user_params
        params.require(:blog_user).permit(:user_id, :blog_id, :description)

    end
end
