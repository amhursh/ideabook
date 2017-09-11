require 'rails_helper'

RSpec.describe Image, type: :model do
  include Paperclip::Shoulda::Matchers

  it { should validate_presence_of :name }

  it { is_expected.to validate_attachment_presence :image }

  it { is_expected.to validate_attachment_content_type(:image).allowing(
  	'image/jpg', 'image/jpeg'
  	).rejecting(
  	'text/plain', 'text/html'
  	)
  }

end
