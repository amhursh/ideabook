require 'rails_helper'

describe "Admin can create new image" do
	context "admin visits user page" do
		scenario "and clicks link and adds image file to create new image" do
			admin = create(:user, role: 'admin')
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit user_path(admin)

			click_on "Add a New Image"

			expect(current_path).to eq new_admin_image_path

			fill_in "image[name]", with: "Bunny Rabbit"
			attach_file("Upload your Image", Rails.root + "spec/fixtures/rabbit.jpeg")
			click_on "Create Image"

			expect(current_path).to eq admin_images_path
			expect(page).to have_content("Bunny Rabbit")
			expect(page).to have_xpath("//img[contains(@src, 'rabbit.jpg')]")
		end
	end
end