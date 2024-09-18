require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(email: "test@email.com", password: "password12!", username: "test")
    expect(user).to be_valid
  end
  it "is not valid without an email" do
    user = User.new(email: nil, password: "password")
    expect(user).to_not be_valid
  end
  it "is not valid without a password" do
    user = User.new(email: "bitus@email.com", password: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without an email and password" do
    user = User.new(email: nil, password: nil)
    expect(user).to_not be_valid
  end
  it "is not valid with a duplicate email" do
    User.create(email: "bitus@email.com", password: "password")
    user = User.new(email: "bitus@email.com", password: "password")
    expect(user).to_not be_valid
  end
  it "is not valid with a password less than 6 characters" do
    user = User.new(email: "lessthan6@gmail.com", password: "pass")
    expect(user).to_not be_valid
  end
  it "is not valid with a password more than 128 characters" do
    user = User.new(email: "morethan128@gmail.com", password: "a" * 129)
    expect(user).to_not be_valid
  end
  it "is not valid with an invalid email" do
    user = User.new(email: "invalidemail.com", password: "password")
    expect(user).to_not be_valid
  end
  it "is not valid with a password that does not contain a number" do
    user = User.new(email: "doesnotcontainanumber@gmail.com", password: "password")
    expect(user).to_not be_valid
  end
  it "is not valid with a password that does not contain a letter" do
    user = User.new(email: "doesnotcontainaleter@gmail.com,", password: "123456")
    expect(user).to_not be_valid
  end
  it "is not valid with a password that does not contain a special character" do
    user = User.new(email: "specialchar@gmail.com", password: "password123")
    expect(user).to_not be_valid
  end
  it "is not valid with a username less than 3 characters" do
    user = User.new(email: "test@gmail.com", password: "password", username: "te")
    expect(user).to_not be_valid
  end
  it "is not valid with a username more than 20 characters" do
    user = User.new(email: "test@gmail.com", password: "password", username: "a" * 21)
    expect(user).to_not be_valid
  end
  it "is not valid without a username" do
    user = User.new(email: "asdf@gmail.com", password: "password", username: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without an is_admin" do
    user = User.new(email: "notadmin@gmail.com", password: "password", username: "notadmin")
    expect(user).to_not be_valid
  end
end
