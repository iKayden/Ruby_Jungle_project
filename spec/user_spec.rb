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
      expect(@user.errors.full_messages).to eq(["Password can't be blank", "Password is too short (minimum is 5 characters)", "Password confirmation can't be blank", "Password can't be blank"])
    end

    it "needs to require password longer than 5 characters" do
      @user = User.new(
        first_name: "Bob",
        last_name: "Ross",
        email: "bobby1985@gmail.com",
        password: "1234",
        password_confirmation: "1234"
      )
      @user.save

      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to eq(["Password is too short (minimum is 5 characters)"])
    end
  end

  describe "#email" do
    it "needs forbid a new user to register if an email already exists in our data base" do
      @user_old = User.new(
        first_name: "Bob",
        last_name: "Ross",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user_old.save

      @user_new = User.new(
        first_name: "Bobby",
        last_name: "Decartes",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user_new.save

      expect(@user_old).to be_valid
      expect(@user_new).not_to be_valid
      expect(@user_new.errors.full_messages).to eq(["Email has already been taken"])
    end
  end

  describe '.authenticate_with_credentials' do
    it "needs to allow creation of new user with valid parameters" do
      @user_new = User.new(
        first_name: "Bobby",
        last_name: "Decartes",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user_new.save
      checked_user = User.authenticate_with_credentials(@user_new.email, @user_new.password)

      expect(checked_user.id).to eq(@user_new.id)
    end

    it "needs to allow creation of new user when an email has whitespaces in the input" do
      @user_new = User.new(
        first_name: "Bobby",
        last_name: "Decartes",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user_new.save
      checked_user = User.authenticate_with_credentials(" bobby1985@gmail.com   ", @user_new.password)

      expect(checked_user.id).to eq(@user_new.id)
    end
    it "needs to allow creation of new user when an email types wrong cases for email in the input ('ExaMple@GmaIl.CoM')" do
      @user_new = User.new(
        first_name: "Bobby",
        last_name: "Decartes",
        email: "bobby1985@gmail.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      @user_new.save
      checked_user = User.authenticate_with_credentials("boBBy1985@gMail.Com", @user_new.password)

      expect(checked_user.id).to eq(@user_new.id)
    end
  end
end
