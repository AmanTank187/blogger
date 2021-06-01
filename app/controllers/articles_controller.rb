class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit, :update, :destroy]
    before_action :require_user, except: [:show,:index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def show 
        
    end

    def index 
        #This gets all the articles from the table
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end 

    def new 
        #Initialising empty article
        @article = Article.new 
        
    end 

    def create 
        @article = Article.new(article_params)
        #Hardcoding user until authentication is implemented!
        @article.user = current_user
        if @article.save
            #If the article is saved then it will show the message and redirect user
            #Want the flash notice to appear on the layout page
            flash[:notice] = "Article was created sccessfully."
            redirect_to @article
        else 
            #If the article is not saved then it will render the form page again which is
            #Article/new.html.erb
            render 'new'
        end 
    end 

    def edit 
        
    end 

    def update
        if @article.update(article_params)
            #If the article is saved then it will show the message and redirect user
            #Want the flash notice to appear on the layout page
            flash[:notice] = "Article was updated sccessfully."
            redirect_to @article
        else 
            #If the article is not saved then it will render the form page again which is
            #Article/edit.html.erb
            render 'edit'
        end 
    end 

    def destroy 
        @article.destroy
        redirect_to articles_path 
    end 

    private 

    def set_article
        @article = Article.find(params[:id])
    end 

    def article_params
        params.require(:article).permit(:title, :description)
    end 
    
    #Checks if the current user equals the user who posted the article so users can't modify other users articles. 
    def require_same_user
        if current_user != @article.user
            flash[:alert] = "Can't edit this article"
            redirect_to @article
        end 
    end 
end 

