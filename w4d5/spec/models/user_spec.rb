require 'rails_helper'

RSpec.describe User  do
  subject(:user) do
    factory_bot_rails.build(:user,
      email: "jonathan@gmail.com",
      password: "ello sir"
    )
  end
  # validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of :password_digest, minimum: 6}


  describe "#is_password?" do
   it "verifies if the password is correct" do
     expect(user.is_password?("ello_sir")).to be true
   end

   describe "#is_password?" do
     it "verifies if the password is correct" do
       expect(user.is_password?("wrong one")).to be true
     end
   end
 end

 describe "#reset_session_token!" do
    it "sets new session_token for user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session_token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user for matching credentials" do
      expect(User.find_by_credentials("jonathan@gmail.com", "ello_sir")).to eq(user)
    end

    it "returns nil for un-matching credentials" do
      expect(User.find_by_credentials("apple@apple.com", "what")).to eq(nil)
    end
  end


end
