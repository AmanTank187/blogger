require 'rails_helper'
RSpec.describe User, type: :model do 
    context 'validations' do 
        it "it ensures details are needed" do 
            user = User.new(username: "",email: "", password: "").save
            expect(user).to eq(false)
        end 

        it "Saves the user when correct information is provided" do 
            user = User.new(username: "amantest",
            email: "amantest@example.com", 
            password: "amantest").save
            expect(user).to eq(true)
        end 

        it "does not save the user if username if blank" do 
            user = User.new(username: nil,
            email: "amantest@example.com", 
            password: "amantest").save
            expect(user).to eq(false)
        end 

        it "does not save the user if username is less than 3 characters" do 
            user = User.new(username: "am",
            email: "amantest@example.com", 
            password: "amantest").save
            expect(user).to eq(false)
        end 

        it "does not save if email is not provided" do 
            user = User.new(username: "amantest",
            email: "amantestexample.com", 
            password: "amantest").save
            expect(user).to eq(false)
        end 

        it "Does not save the user if email has already been used" do 
            user1 = User.new(username: "amantest",
            email: "amantest@example.com", 
            password: "amantest").save

            user = User.new(username: "amantest20",
            email: "amantest@example.com", 
            password: "amantest1").save

            expect(user).to eq(false)
        end 
    end 

    context 'Associations between User and Article' do 
        it "Articles should be deleted if User is deleted" do 
            user = User.new(username: "amantest1",
            email: "amantest1@example.com", 
            password: "amantest1").save

            user_id = User.last.id

            article = Article.new(title: "This article should be deleted",
                                    description: "Deleted because i'll remove the user",
                                    user_id: user_id).save
            
            user = User.last 
            user.destroy
        
            expect(Article.first).to eq (nil)
        end 
    end 
end 