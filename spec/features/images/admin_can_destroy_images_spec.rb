require 'rails_helper'

describe "Admin can destroy image" do
	context "admin visits user page" do
		scenario "and clicks link to see all images and delete an image" do
			admin = create(:user, role: 'admin')
			image = create(:image)
			image2 = create(:image)
			img_name = image.name
			img2_name = image2.name
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

			visit user_path(admin)

			click_on "See All Images"

			expect(current_path).to eq admin_images_path

			within(".image_#{image.id}") do
				click_on "Delete"
			end

			expect(current_path).to eq admin_images_path
			expect(page).to_not have_content(img_name)
			expect(page).to have_content(img2_name)
		end
	end
end