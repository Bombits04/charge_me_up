class AdminController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  def pending_chg_spot
    @chg_spots = ChgSpot.all.where(is_approved: false)
    @pagy, @results = pagy(@chg_spots)
  end

  def approve_chg_spot
    @chg_spot = ChgSpot.find(params[:id])
    @chg_spot.is_approved = true
    @chg_spot.save

    redirect_to approve_spot_path, notice: "Charging spot was successfully approved. (#{@chg_spot.name})"
  end

  def delete_chg_spot
    @chg_spot = ChgSpot.find(params[:id])
    @chg_spot.destroy!

    redirect_to root_path, notice: "Charging spot was successfully deleted. (#{@chg_spot.name})"
  end
end
