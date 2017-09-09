require 'rails_helper'

describe "User visits user show page" do
	context "user clicks on link to ideas" do
		scenario "user can see all associated ideas" do
			user = create(:user)
			idea = user.ideas.create(title: "hello", description: "this is a description")
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

			visit user_path(user)

			click_on "See All Ideas"

			expect(current_path).to eq user_categories_path
			expect(page).to have_content(idea.id)
			expect(page).to have_content(idea.title)
			expect(page).to have_content("All ideas for #{user.username}")
		end
	end
end