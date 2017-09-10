require 'rails_helper'

describe "Admin can delete new category" do
	context "admin visits user page and clicks link to see all categories" do
		xscenario "admin clicks link to destroy category" do
			admin = create(:user, role: "admin")
			category_one = create(:category)
			category_two = create(:category)
			cat_one_name = category_one.name
			cat_two_name = category_two.name
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit user_path(admin)

			click_on "Manage Categories"

			expect(current_path).to eq admin_categories_path

			click_on 
		end
	end
end