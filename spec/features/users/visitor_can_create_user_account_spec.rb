require 'rails_helper'

describe "visitor becomes user" do
  context "visitor creates new user account" do
    scenario "guest provides information to create account" do
      visit '/'
      click_on "Sign Up"
      fill_in "user[username]", with: "Aaron"
      fill_in "user[email]", with: "aaron@aaron.com"
      fill_in "user[password]", with: "12345"
      click_button "Create Account"

      expect(current_path).to eq user_path(User.last)
      expect(page).to have_content("Aaron's IdeaBox")
    end
  end
end
