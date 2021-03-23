class ArticlesController < ApplicationController
    def show 
        #This method finds a specific article using the id of the article
        @article = Article.find(params[:id])
    end

    def index 
        #This gets all the articles from the table
        @articles = Article.all
    end 

    def new 
        #Initialising empty article
        @article = Article.new 
        
    end 

    def create 
        @article = Article.new(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
    end 

    def update
        @article = Article.find(params[:id])
        
        if @article.update(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path 
    end 
end 

