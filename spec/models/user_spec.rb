require 'rails_helper'
RSpec.describe User, type: :model do 
    context 'validations' do 
        it "it ensures details are needed" do 
            user = User.new(username: "",email: "", password: "").save
            expect(user).to eq(false)
        end 
    end 
end 