class BlogsController < ApplicationController
  	def index
		@restaurant_users = RestaurantUser.all
		@blogs = Blog.where("restaurant_id = ?", "#{@current_restaurant.id}").paginate(:per_page => 1, :page => params[:page])
		@blogs_view = Blog.where("restaurant_id = ?", "#{@current_restaurant.id}").paginate(:per_page => 20, :page => params[:page])
		@blog = Blog.new
		@blog_comments = BlogUser.all.paginate(:per_page => 3, :page => params[:page])
		@blog_comment = BlogUser.new
	end

	def show
		@restaurant_users = RestaurantUser.all
		@blog = Blog.find(params[:id])
	end

	def new
		@restaurant_users = RestaurantUser.all
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			flash[:notice] = "Successfully created blog."
			redirect_to @blog
		else
			render :action =>'new'
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
	    @blog = Blog.find(params[:id])
	    if @blog.update_attributes(blog_params)
	      	flash[:notice] = "Successfully updated blog."
	      	redirect_to @blog
	    else
	      	render :action => 'edit'
	    end
  	end
  
  	def destroy
	    	@blog = Blog.find(params[:id])
	    	@blog.destroy
	    	flash[:notice] = "Successfully destroyed blog."
	    	redirect_to blogs_url
  	end
  
  	private

  	def blog_params
  		params.require(:blog).permit(:title, :description, :is_closed, :restaurant_id, :user_id)

  	end

  	def sort_column
    		Blog.column_names.include?(params[:sort]) ? params[:sort] : "title"
  	end
  
  	def sort_direction
    		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  	end
end
