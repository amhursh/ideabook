require 'rails_helper'

RSpec.describe User, type: :model do
	context "validations" do
		it { is_expected.to validate_presence_of(:username) }
		it { is_expected.to validate_uniqueness_of(:username) }
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_uniqueness_of(:email) }
		it { is_expected.to validate_presence_of(:password) }
	end

	context "authorizations" do
		it "can be created as an admin" do
			user = create(:user, role: 'admin')

			expect(user.role).to eq('admin')
			expect(user.admin?).to be_truthy
		end

		it "can be created as default user" do
			user = create(:user)

			expect(user.role).to eq('default')
			expect(user.default?).to be_truthy
		end
	end
end
