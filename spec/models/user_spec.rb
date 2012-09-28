require 'spec_helper'

describe User do
  let(:auth) { { 'provider' => 'test',
                 'uid' => 'test_user',
                 'user_info' => { 'name' => 'joe' }
  } }
  context "#register" do

    it "creates a user" do
      expect {
        User.register(auth)
      }.to change {User.count}.by(1)
    end

    it "creates a user registration" do
      expect {
        User.register(auth)
      }.to change {Registration.count}.by(1)
    end

    it "returns a user reference" do
      User.register(auth).should_not be_nil
    end

    it "associates a registration with the user" do
      user = User.register(auth)
      registration = Registration.find_by_auth(auth)
      user.registrations.should include registration
    end
  end

  context "#lookup" do
    let!(:user) { User.register(auth) }

    it {User.lookup(auth).id.should == user.id }
  end
end
