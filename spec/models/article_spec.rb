require 'rails_helper'

RSpec.describe Article, type: :model do 

    before do 
        user = User.new(username: "amantest",
        email: "amantest@example.com", 
        password: "amantest").save

        @user_id = User.first.id
    end 

        context 'validations' do 

            it "Creates and saves the message with correct details" do 

                article = Article.new(title: "Article Title with correct length",
                                    description: "Description of the correct length",
                                    user_id: @user_id).save

                articles = Article.first 
                
                expect(article).to eq (true)
                expect(articles.title).to eq ("Article Title with correct length")
                expect(articles.description).to eq("Description of the correct length")
                expect(articles.user_id).to eq (@user_id)
            end 

            it "Article should not save and return false if title is not atleast 6 characters" do 
                article = Article.new(title: "a",
                                    description: "Description of the correct length",
                                    user_id: @user_id).save
    
                expect(article).to eq (false)
            end 

            it "Article should not save and return false is no title is given" do 
                article = Article.new(title: nil,
                                    description: "Description of the correct length",
                                    user_id: @user_id).save
    
                expect(article).to eq (false)
            end 

            it "Article should not save and return false if description is not atleast 10 characters" do 
                article = Article.new(title: "Title is more than 6",
                                    description: "Desc",
                                    user_id: @user_id).save
    
                expect(article).to eq (false)
            end 

            it "Article should not save and return false if description is not given" do 
                article = Article.new(title: "Title is more than 6",
                                    description: nil,
                                    user_id: @user_id).save
    
                expect(article).to eq (false)
            end 
        end 

        context 'Associations between User and Article' do 

            it 'Articles should belong to user they are created by' do 

                article = Article.new(title: "Article Title with correct length",
                                    description: "Description of the correct length",
                                    user_id: @user_id).save

                article_two = Article.new(title: "Article Title with correct length 2",
                                    description: "Description of the correct length 2",
                                    user_id: @user_id).save

                user = User.first
               
                expect(user.articles.length).to eq(2)
                
            end
        end 
end 