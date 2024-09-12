class SearchController < ApplicationController
  include Pagy::Backend

  def search
    Rails.logger.debug "params[:q]: #{params[:q].inspect}"
    @q = ChgSpot.ransack(params[:q])
    @result = @q.result
    @pagy, @search_results = pagy(@result)
    render :search
  end

  def search_details
    @chg_spot = ChgSpot.find_by(id: params[:id])
    if @chg_spot.nil?
      flash[:alert] = "Charging spot not found."
      redirect_to root_path
    else
      render :search_details
    end
  end

  def show
    @chg_spot = ChgSpot.find_by(id: params[:id])
    if @chg_spot.nil?
      flash[:alert] = "Charging spot not found."
      redirect_to root_path
    end
  end
end
