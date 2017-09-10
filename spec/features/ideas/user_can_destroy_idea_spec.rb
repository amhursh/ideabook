require 'rails_helper'

describe "User can destroy idea" do
	context "user visits idea page" do
		scenario "and can click link to delete idea" do
			user = create(:user)
			category = create(:category)
			idea = create(:idea, user: user, category: category)
			idea2 = create(:idea, user: user, category: category)
			idea_title = idea.title
			idea_body = idea.body
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "See All Ideas"
			save_and_open_page

			expect(page).to have_content(idea.title)
			expect(page).to have_content(idea.body)

			click_on idea.title

			click_on "Delete"
			save_and_open_page

			expect(current_path).to eq user_ideas_path(user)
			expect(page).to_not have_content(idea_title)
			expect(page).to_not have_content(idea_body)
			expect(page).to have_content(idea2.title)
			expect(page).to have_content(idea2.body)
		end
	end
end