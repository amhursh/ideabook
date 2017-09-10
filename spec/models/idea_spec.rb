require 'rails_helper'

RSpec.describe Idea, type: :model do
	context "validations" do
		it { is_expected.to validate_presence_of(:title) }
		it { is_expected.to validate_presence_of(:body) }
		it { is_expected.to validate_presence_of(:user_id) }
		it { is_expected.to validate_presence_of(:category_id)}
	end
end
