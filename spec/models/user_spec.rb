require 'rails_helper'

RSpec.describe User, :type => :model do

  context "when email address is missing" do
    let(:user) { User.new(email: "") }

    it "should not be valid" do
      expect(user.valid?).to be_falsey
    end

    it "should raise a validation exception" do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
