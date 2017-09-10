require 'rails_helper'

describe "User can destroy idea" do
	context "user visits idea page" do
		scenario "and can click link to delete idea" do
			user = create(:user)
			category = create(:category)
			idea = create(:idea, user: user, category: category)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "See All Ideas"

			expect(page).to have_content(idea.title)
			expect(page).to have_content(idea.body)

			click_on idea.title

			click_on "Delete"

			expect(current_path).to eq user_ideas_path(user)
			expect(page).to_not have_content(idea.title)
			expect(page).to_not have_content(idea.body)
		end
	end
end