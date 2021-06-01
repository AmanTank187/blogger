class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? # Line three enables the current user method to be used within views and other controllers.
    
    #Current user will be assigned to a user_id if theres a session in place. If current user is already assigned then it will not assign again. 
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end 

    # the double ! ensures that current user will return true or false
    def logged_in?
        !!current_user
    end 
    #Checks if someone is not logged in and redirects them to log in
    def require_user 
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end 
    end 
end
