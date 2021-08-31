require 'rails_helper'

RSpec.feature "Sign-Up", type: :feature do
    scenario "Can sign up to blogger" do
      visit "/signup"
      fill_in "user_username", with: "Amant"
      fill_in "user_email", with: "Amant@example.com"
      fill_in "user_password", with: "Amant"
      click_button("Sign up")
      expect(page).to have_content("Amant")
    end
end 