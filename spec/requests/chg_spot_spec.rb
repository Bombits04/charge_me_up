require "rails_helper"

RSpec.describe "ChgSpots", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users, :chg_spots
  let(:user) { users(:user) }
  let(:chg_spot) { chg_spots(:chg_spot_1) }

  before do
    sign_in user
  end

  describe "GET /chg_spots/:id" do
    it "returns a successful response" do
      #   debugger
      get search_details_path(chg_spot)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /chg_spots" do
    context "with valid attributes" do
      it "creates a new chg_spot" do
        expect {
          post chg_spots_path, params: { chg_spot: { name: "test1", address: "address test", lat: "1.0", lng: "1.0" } }
        }.to change(ChgSpot, :count).by(1)
      end

      it "redirects to the chg_spot path" do
        post chg_spots_path, params: { chg_spot: { name: "test1", address: "address test", lat: "1.0", lng: "1.0" } }
        expect(response).to redirect_to(search_details_path(ChgSpot.last))
      end
    end

    context "with invalid attributes" do
      it "does not create a new chg_spot" do
        expect {
          post chg_spots_path, params: { chg_spot: { name: "test1", lat: "1.0", lng: "1.0" } }
        }.to_not change(ChgSpot, :count)
      end

      it "redirects to new" do
        post chg_spots_path, params: { chg_spot: { name: "test1", lat: "1.0", lng: "1.0" } }
        expect(response).to redirect_to(new_chg_spot_path)
      end
    end
  end

  describe "PATCH /chg_spots/:id" do
    context "with valid attributes" do
      it "updates the chg_spot" do
        chg_spot.update(region: "Updated Name", user: user)
        patch chg_spot_path(chg_spot)
        chg_spot.reload
        expect(ChgSpot.find(chg_spot.id).region).to eq("Updated Name")
      end

      it "redirects to the chg_spot path" do
        patch chg_spot_path(chg_spot), params: { chg_spot: { name: "Updated Name" } }
        chg_spot.reload
        expect(response).to redirect_to(edit_chg_spot_path(chg_spot))
      end
    end

    context "with invalid attributes" do
      it "does not update the chg_spot" do
        chg_spot.update(name: nil)
        patch chg_spot_path(chg_spot)
        chg_spot.reload
        expect(chg_spot.name).to_not be_nil
      end

      it "redirects to edit" do
        patch chg_spot_path(chg_spot), params: { chg_spot: { name: "" } }
        chg_spot.reload
        expect(response).to redirect_to(edit_chg_spot_path(chg_spot))
      end
    end
  end

  describe "DELETE /chg_spots/:id" do
    it "deletes the chg_spot" do
      expect {
        delete delete_spot_path(chg_spot), headers: { "Accept" => "text/html" }
      }.to change(ChgSpot, :count).by(-1)
    end

    it "redirects to the root" do
      delete delete_spot_path(chg_spot), headers: { "Accept" => "text/html" }
      expect(response).to redirect_to(root_path)
    end
  end
end
