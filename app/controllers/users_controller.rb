class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show 
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end 

    def index 
        @users = User.paginate(page: params[:page], per_page: 5)
    end 

    def new 
        #Initialising user
        @user = User.new 
    end 

    def edit 

    end 

    def update 
        if @user.update(user_params)
            flash[:notice] = "Profile was updated sccessfully."
            redirect_to @user 
        else 
            render 'edit'
        end 
    end 

    def create 
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id 
            flash[:notice] = "Welcome to Blogger  #{@user.username} ! You have successfully signed up"
            redirect_to articles_path 
        else 
            render 'new'
        end 
    end

    def destroy
        @user.destroy
        session[:user_id] = nil #Setting session back to nil otherwise session id will still be assigned to the account.
        flash[:notice] = "Account is successfully deleted"
        redirect_to root_path
    end 

    private 

    def set_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

    def require_same_user
        if current_user != @user
            flash[:alert] = "Can't edit this user"
            redirect_to @user
        end 
    end 


end 