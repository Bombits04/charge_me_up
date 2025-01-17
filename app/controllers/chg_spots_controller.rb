class ChgSpotsController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote, :new, :create, :edit, :update]
  before_action :set_chg_spot, only: [:upvote, :downvote, :edit, :update]

  def upvote
    @chg_spot.upvote
    redirect_to chg_spot_path(@chg_spot)
  end

  def downvote
    @chg_spot.downvote
    redirect_to chg_spot_path(@chg_spot)
  end

  def new
    @chg_spot = ChgSpot.new
  end

  def create
    name = current_user.username ? current_user.username : current_user.email

    @chg_spot = ChgSpot.new(chg_spot_params)
    @chg_spot.user_id = current_user.id
    @chg_spot.created_by = name
    @chg_spot.updated_by = name
    @chg_spot.is_approved = false

    if @chg_spot.save
      redirect_to search_details_path(@chg_spot), notice: "Charging spot was successfully created."
    else
      redirect_to new_chg_spot_path, alert: "Charging spot was not created."
    end
  end

  def edit
    @chg_spot = ChgSpot.find(params[:id])
  end

  def update
    @chg_spot = ChgSpot.find(params[:id])
    name = current_user.username ? current_user.username : current_user.email
    @chg_spot.updated_by = name

    if @chg_spot.update(chg_spot_params)
      flash[:notice] = "Charging spot updated successfully."
      redirect_to search_details_path(@chg_spot)
    else
      flash[:alert] = "There was an error updating the charging spot."
      redirect_to edit_chg_spot_path(@chg_spot)
    end
  end

  private

  def set_chg_spot
    @chg_spot = ChgSpot.find(params[:id])
  end

  def chg_spot_params
    params.require(:chg_spot).permit(:name, :region, :province, :city, :barangay, :address, :description, :lat, :lng, :notes, :place_id)
  end
end
