require 'rails_helper'

RSpec.describe ChgSpot, type: :model do
    it "is valid with valid attributes" do
        user = User.create!(id: 1, email: "test@gmail.com", password: "password12!", username: "test")
        chg_spot = ChgSpot.new(id: 1, name: "title", description: "description", user_id: user.id, address: "address", city: "city", province: "province", region: "region", lat: "lat", lng: "lng", place_id: "place_id", notes: "notes", score: 1, is_approved: true, created_by: "created_by", updated_by: "updated_by")
        expect(chg_spot).to be_valid
    end
    it "is not valid without a title" do
        user = User.create(email: "test2@gmail.com", password: "password12!", username: "test2")
        chg_spot = ChgSpot.new(name: nil, description: "description", user_id: user.id)
        expect(chg_spot).to_not be_valid
    end
    it "is not valid without a description" do
        user = User.create(email: "test@gmail.com", password: "password12!", username: "test")
        chg_spot = ChgSpot.new(name: "title", description: nil, user_id: user.id)
        expect(chg_spot).to_not be_valid
    end
    it "is not valid without a user_id" do
        chg_spot = ChgSpot.new(name: "title", description: "description", user_id: nil)
        expect(chg_spot).to_not be_valid
    end
end