class EmailsController < ApplicationController
    def index
        #Bandeja de entrada
        #@emails_in = Email.where("user_for = ? OR user_for = ?", "#{current_user.email}", "#{@current_restaurant.email}").paginate(:per_page => 5, :page => params[:page])
        #@emails_in_rest = Email.where("user_for = ?", "#{@current_restaurant.email}").paginate(:per_page => 5, :page => params[:page])
        #Bandeja de enviados
        #@emails_out = Email.where("user_from = ?", "#{current_user.email}").paginate(:per_page => 5, :page => params[:page]) 
        #@emails_out_rest = Email.where("user_from = ?", "#{@current_restaurant.email}").paginate(:per_page => 5, :page => params[:page])

        #Bandeja de entrada donde los correos del restaurante aparecen asociados con los correos del usuario
        #Bandeja de entrada
        if @current_role == RestaurantUser::ROLES.index('GERENTE')
            @emails_in = Email.where("user_for = ? OR user_for = ?", "#{current_user.email}", "#{@current_restaurant.email}").paginate(:per_page => 5, :page => params[:page])
        else 
            @emails_in = Email.where("user_for = ?", "#{current_user.email}").paginate(:per_page => 5, :page => params[:page])
            if !current_user.superadmin
                @email_rest = Restaurant.where("email = ?", "#{@current_restaurant.email}")
            end
        end
        #Bandeja de enviados
        if @current_role == RestaurantUser::ROLES.index('GERENTE')
            @emails_out = Email.where("user_from = ? OR user_from = ?", "#{current_user.email}", "#{@current_restaurant.email}").paginate(:per_page => 5, :page => params[:page])
        else 
            @emails_out = Email.where("user_from = ?", "#{current_user.email}").paginate(:per_page => 5, :page => params[:page])
        end

    end

    def show
        @email = Email.find(params[:id])
    end

    def new
        @email = Email.new
    end

    def create
        @email = Email.new(email_params)
        if @email.save
            flash[:notice] = "Successfully created email."
            redirect_to @email
        else
            render :action =>'new'
        end
    end

    def edit
        @email = Email.find(params[:id])
    end

    def update
        @email = Email.find(params[:id])
        if @email.update_attributes(email_params)
            flash[:notice] = "Successfully updated email."
            redirect_to @email
        else
            render :action => 'edit'
        end
    end
  
    def destroy
        @email = Email.find(params[:id])
        @email.destroy
        flash[:notice] = "Successfully destroyed email."
        redirect_to emails_url
    end
  
    private

    def email_params
        params.require(:email).permit(:subject, :description, :is_view, :is_sent, :user_for, :user_from)

    end

    def sort_column
            Email.column_names.include?(params[:sort]) ? params[:sort] : "subject"
    end
  
    def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
