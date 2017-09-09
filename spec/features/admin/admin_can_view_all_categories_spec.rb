require 'rails_helper'

describe "User visits categories index page" do
	context "as admin" do
		scenario "and can see all categories" do
			admin = create(:user, role: "admin")
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit admin_categories_path

			expect(page).to have_content("Categories")
		end
	end

	context "as user" do
		scenario "and sees 404" do
			user = create(:user)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit admin_categories_path

			expect(page).to_not have_content("Categories")
		end
	end
end