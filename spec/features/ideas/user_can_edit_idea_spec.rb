require 'rails_helper'

describe "User can edit idea" do
	context "user clicks on edit link" do
		scenario "user fills in information to update idea" do
			user = create(:user)
			category = create(:category)
			idea = create(:idea, user: user, category: category)
			original_descrip = idea.body
			original_title = idea.title

			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "See All Ideas"
			click_on "Edit"
			fill_in "idea[title]", with: "New Title"
			click_on "Update Idea"

			expect(current_path).to eq user_idea_path(user, idea)
			expect(page).to have_content("New Title")
			expect(page).to have_content(original_descrip)
			expect(page).to_not have_content(original_title)
		end
	end
end