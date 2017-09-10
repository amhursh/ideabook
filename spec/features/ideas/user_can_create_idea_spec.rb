require 'rails_helper'

describe "User creates idea" do
	context "user clicks on link to create new idea" do
		scenario "user fills in information to create idea" do
			user = create(:user)
			category = create(:category)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "Create an Idea"

			fill_in "idea[title]", with: "Good Idea"
			fill_in "idea[body]", with: "This is an Idea's description"
			select category.name, from: "idea[category_id]"
			click_on "Create Idea"

			expect(current_path).to eq user_idea_path(user, user.ideas.first)
			expect(page).to have_content("Good Idea")
			expect(page).to have_content("This is an Idea's description")
		end
	end
end