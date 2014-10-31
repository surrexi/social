require 'spec_helper'

describe User do
  before(:all) do
    mock_auth_hash
    @auth = OmniAuth.config.mock_auth[:facebook]
  end

  describe '.find_for_oauth' do
    it "login with email and uid" do
      user = User.create!(email: 'example@gmail.com', password: 'secret')
      Identity.create!(uid: "123545", provider: "facebook", user: user)
      user1 = User.find_for_oauth(@auth)

      expect(user1).to eq(user)
    end

    it "login without uid" do
      user = User.create!(email: 'example@gmail.com', password: 'secret')
      user1 = User.find_for_oauth(@auth)
      identity = Identity.find_for_oauth(@auth)

      expect(user1).to eq(user)
      expect(identity.user).to eq(user)
    end

    it "login new user" do
      user = User.find_for_oauth(@auth)
      identity = Identity.find_for_oauth(@auth)

      expect(identity.user).to eq(user)
    end
  end
end
