require 'rails_helper'

describe "Admin can create new category" do
	context "admin visits user page" do
		scenario "and clicks link and fills in information to create new category" do
			admin = create(:user, role: "admin")
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit user_path(admin)

			click_on "Create New Category"

			expect(current_path).to eq new_admin_category_path

			fill_in "category[name]", with: "Awesome Category"
			click_on "Create Category"

			expect(current_path).to eq admin_categories_path
			expect(page).to have_content("Awesome Category")
		end
	end

	context "user visits user page" do
		scenario "and cannot see link to create new category" do
			user = create(:user)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			expect(page).to_not have_content("Create New Category")
		end
	end
end