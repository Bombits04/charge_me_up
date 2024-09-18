require 'rails_helper'

RSpec.describe Comment, type: :model do
    it "is valid with valid attributes" do
        user = User.create!(id: 1, email: "test@email.com", password: "password12!", username: "test")
        chg_spot = ChgSpot.create!(id: 1, name: "title", description: "description", user_id: user.id, address: "address", city: "city", province: "province", region: "region", lat: "lat", lng: "lng", place_id: "place_id", notes: "notes", score: 1, is_approved: true, created_by: "created_by", updated_by: "updated_by")
        comment = Comment.new(id: 1, comment: "body", user_id: 1, chg_spot_id: 1)
        expect(comment).to be_valid
    end
    it "is not valid without a body" do
        user = User.create(email: "test2@email.com", password: "password12!", username: "test2")
        chg_spot = ChgSpot.create(name: "title", description: "description", user_id: user.id)
        comment = Comment.new(comment: nil, user_id: user.id, chg_spot_id: chg_spot.id)
        expect(comment).to_not be_valid
    end
    it "is not valid without a user_id" do
        user = User.create(email: "test3@gmail.com", password: "password12!", username: "test3")
        chg_spot = ChgSpot.create(name: "title", description: "description", user_id: user.id)
        comment = Comment.new(comment: "body", user_id: nil, chg_spot_id: chg_spot.id)
        expect(comment).to_not be_valid
    end
    it "is not valid without a chg_spot_id" do
        user = User.create(email: "test@email.com", password: "password12!", username: "test")
        chg_spot = ChgSpot.create(name: "title", description: "description", user_id: user.id)
        comment = Comment.new(comment: "body", user_id: user.id, chg_spot_id: nil)
        expect(comment).to_not be_valid
    end
end