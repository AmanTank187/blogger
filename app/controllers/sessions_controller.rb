class SessionsController < ApplicationController
    def new 

    end 

    def create
        user = User.find_by(username: params[:session][:username])
            #Finds the user by the params session hash. 
        if user && user.authenticate(params[:session][:password])
            #If the user is found and the password of the params session hash equals user password it is then authenticated 
            session[:user_id] = user.id  
            flash[:notice] = "Logged in sucessfully"
            redirect_to user
        else 
            flash.now[:alert] = "Incorrect login details"
            #Using flash.now as we are not redirecting like other times. We are rendering 
            #So we want the message to show now
            render 'new'
        end 
    end 

    def destroy 
        session[:user_id] = nil 
        flash[:notice] = "Logged out sucessfully"
        redirect_to root_path
    end 
end