require 'rails_helper'

describe "Admin can delete new category" do
	context "admin visits user page and clicks link to see all categories" do
		scenario "admin clicks link to destroy category" do
			admin = create(:user, role: "admin")
			category_one = create(:category)
			category_two = create(:category)
			cat_one_name = category_one.name
			cat_two_name = category_two.name
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit user_path(admin)

			click_on "Delete a Category"

			expect(current_path).to eq admin_categories_path

			within(".category_#{category_two.id}") do
				click_on "Delete"
			end

			expect(current_path).to eq admin_categories_path
			expect(page).to_not have_content(cat_two_name)
			expect(page).to have_content(cat_one_name)
		end
	end

	context "user visits user page" do
		scenario "and cannot see link to delete a category" do
			user = create(:user)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			expect(page).to_not have_content("Delete a Category")
		end
	end

	context "user tries to visit categories index" do
		scenario "and sees 404"	do
			user = create(:user)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit admin_categories_path

			expect(page).to have_content("404")
		end	
	end
end