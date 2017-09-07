require 'rails_helper'

describe "visitor can log in as user" do
  context "visitor clicks link to log in" do
    scenario "visitor provides information to log into user account" do
      user = create(:user)
      visit root_path
      click_on "Log In"

      expect(current_path).to eq login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "Log In"

      expect(current_path).to eq user_path(user)
      expect(page).to have_content(user.username)
    end
  end
end
