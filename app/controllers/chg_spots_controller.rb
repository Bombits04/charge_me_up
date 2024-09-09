class ChgSpotsController < ApplicationController
  #   before_action :authenticate_user!, only: [:upvote, :downvote]
  before_action :set_chg_spot, only: [:upvote, :downvote]

  def upvote
    @chg_spot.upvote
    redirect_to chg_spot_path(@chg_spot)
  end

  def downvote
    @chg_spot.downvote
    redirect_to chg_spot_path(@chg_spot)
  end

  private

  def set_chg_spot
    @chg_spot = ChgSpot.find(params[:id])
  end
end
