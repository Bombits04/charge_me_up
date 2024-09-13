class SearchController < ApplicationController
  include Pagy::Backend

  def search
    search_query = search_params.merge(is_approved_eq: true)

    @q = ChgSpot.ransack(search_query)
    @result = @q.result
    debugger
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

  private

  def search_params
    params.fetch(:q, {}).permit(:is_approved_eq, :name_or_region_or_province_or_city_or_address_cont) # Add other permitted params as needed
  end
end
