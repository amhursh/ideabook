class Image < ApplicationRecord
	has_many :idea_images
	has_many :ideas, through: :idea_images

	has_attached_file :image, styles: { standard: "300x300" }
end
