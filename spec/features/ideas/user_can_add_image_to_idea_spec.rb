require 'rails_helper'

describe "User creates Idea with Image" do
	context "user clicks on link to create new idea" do
		scenario "user fills in information to create idea with image" do
			user = create(:user)
			category = create(:category)
			image1 = create(:image)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "Create an Idea"

			fill_in "idea[title]", with: "wow a bunny"
			fill_in "idea[body]", with: "bunnies are great"
			select category.name, from: "idea[category_id]"
			check image1.name
			click_on "Create Idea"

			expect(current_path).to eq user_idea_path(user, user.ideas.first)
			expect(page).to have_content("wow a bunny")
			expect(page).to have_content("bunnies are great")
			expect(page).to have_xpath("//img[contains(@src, 'rabbit.jpg')]")
		end
	end
end