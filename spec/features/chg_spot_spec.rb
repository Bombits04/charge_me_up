require 'rails_helper'

RSpec.feature 'ChgSpots', type: :feature do
  include Devise::Test::IntegrationHelpers
  fixtures :users, :chg_spots
  let(:user) { users(:user) }
  let(:chg_spot) { chg_spots(:chg_spot_1) }

  before do
    sign_in user
  end

  scenario 'User views a charge spot' do
    visit search_details_path(chg_spot)
    expect(page).to have_content(chg_spot.name)
    expect(page).to have_content(chg_spot.address)
  end

  scenario 'User creates a new charge spot' do
    visit new_chg_spot_path

    fill_in 'name', with: 'New ChgSpot'
    fill_in 'address', with: 'New Address'
    fill_in 'lat', with: '1.0'
    fill_in 'lng', with: '1.0'

    click_on ('Create Charging Spot')
    # puts page.body
    expect(current_path).to eql(new_chg_spot_path)
    # expect(page).to have_content('Charge spot was successfully created.')
  end

  # scenario 'User updates a charge spot' do
  #   visit edit_chg_spot_path(chg_spot)


  #   within("form#chg_spot_form") do
  #     fill_in 'name', with: 'Updated Name'
  #     fill_in 'f-address', with: 'Updated Address'
  #     fill_in 'lat', with: '2.0'
  #     fill_in 'lng', with: '2.0'
  #     click_button ('update')
  #   end
    
  #   # puts page.body 'name'
     
  #   # puts page.body
  #   expect(page.body).to have_content('Updated Name')
  # end

  # scenario 'User deletes a charge spot' do
  #   visit chg_spot_path(chg_spot)
  #   click_link ('Delete')

  #   expect(page).to have_content('Charge spot was successfully destroyed.')
  #   expect(page).to_not have_content(chg_spot.name)
  # end
end
