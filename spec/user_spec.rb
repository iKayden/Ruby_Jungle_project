require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#password" do
    it "must be created with a password and password_confirmation fields" do
      @user = User.new(
        first_name: "Bob",
        last_name: "Ross",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user.save

      expect(@user).to be_valid
    end

    it "needs to throw an err if password and password_confirmation are not matching" do
      @user = User.new(
        first_name: "Bob",
        last_name: "Ross",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "12345"
      )
      @user.save

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it "needs to require password and password_confirmation when creating new User" do
      @user = User.new(
        first_name: "Bob",
        last_name: "Ross",
        email: "bobby1985@gmail.com"
        # no password
      )
      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to eq(["Password can't be blank", "Password confirmation can't be blank", "Password can't be blank"])
    end


  end
end
