require 'rails_helper'

describe "user can log out" do
  context "visitor clicks link to log out" do
    scenario "user clicks log out link and session is terminated" do
      user = create(:user)

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "Log In"

      expect(current_path).to eq user_path(user)

      click_on "Log Out"

      expect(current_path).to eq root_path
      expect(page).to have_content("Log In")
    end
  end
end
