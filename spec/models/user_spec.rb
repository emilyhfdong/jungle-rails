require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: "emily@email.com",
        password: "hello",
        password_confirmation: "hello"
        )
      @user.save
      expect(@user).to be_valid
    end
    it "is not valid if password and password_confirmation don't match" do
      @user = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: "emily@email.com",
        password: "hello",
        password_confirmation: "hello2"
        )
      @user.save
      expect(@user).to_not be_valid
    end
    it "is not valid without a email" do
      @user = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: nil,
        password: "hello",
        password_confirmation: "hello"
        )
      @user.save
      expect(@user).to_not be_valid
    end
    it "is not valid without a first name" do
      @user = User.new(
        first_name: nil,
        last_name: "Dong",
        email: "emily@email.com",
        password: "hello",
        password_confirmation: "hello"
        )
      @user.save
      expect(@user).to_not be_valid
    end
    it "is not valid without a last name" do
      @user = User.new(
        first_name: "Emily",
        last_name: nil,
        email: "emily@email.com",
        password: "hello",
        password_confirmation: "hello"
        )
      @user.save
      expect(@user).to_not be_valid
    end
    it "is not valid if the email is not unique" do
      @user1 = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: "emily@email.com",
        password: "hello",
        password_confirmation: "hello"
        )
      @user1.save
      @user2 = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: "emily@email.COM",
        password: "hello",
        password_confirmation: "hello"
        )
      expect(@user2).to_not be_valid
    end
    it "is not valid if the password is less than 5 characters" do
      @user = User.new(
        first_name: "Emily",
        last_name: "Dong",
        email: "emily@email.com",
        password: "hi",
        password_confirmation: "hi"
        )
      expect(@user).to_not be_valid
    end
  end
end
