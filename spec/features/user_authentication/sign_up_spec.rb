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

    scenario "Can't sign up if username is less than 3 characters" do
      visit "/signup"
      fill_in "user_username", with: "Am"
      fill_in "user_email", with: "Amant@example.com"
      fill_in "user_password", with: "Amant"
      click_button("Sign up")
      expect(page).to have_content("Username is too short (minimum is 3 characters)")
    end

    scenario "Can't sign up if username is blank" do
      visit "/signup"
      fill_in "user_username", with: ""
      fill_in "user_email", with: "Amant@example.com"
      fill_in "user_password", with: "Amant"
      click_button("Sign up")
      expect(page).to have_content("Username can't be blank")
    end

    scenario "Can't sign up if email is blank" do
      visit "/signup"
      fill_in "user_username", with: "Amant"
      fill_in "user_email", with: ""
      fill_in "user_password", with: "Amant"
      click_button("Sign up")
      expect(page).to have_content("Email can't be blank")
    end

    scenario "Can't sign up if email is invalid format" do
      visit "/signup"
      fill_in "user_username", with: "Amant"
      fill_in "user_email", with: "Amantexample.com"
      fill_in "user_password", with: "Amant"
      click_button("Sign up")
      expect(page).to have_content("Email is invalid")
    end

    scenario "Can't sign up if password is not given" do
      visit "/signup"
      fill_in "user_username", with: "Amant"
      fill_in "user_email", with: "Amantexample.com"
      fill_in "user_password", with: ""
      click_button("Sign up")
      expect(page).to have_content("Password can't be blank")
    end
end 