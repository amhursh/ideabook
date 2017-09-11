class Image < ApplicationRecord
	has_many :idea_images
	has_many :ideas, through: :idea_images

	has_attached_file :image, styles: { standard: "300x300>" }
	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg"]
	validates :name, presence: true
	validates :image, attachment_presence: true

end
