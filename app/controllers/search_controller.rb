class SearchController < ApplicationController
  def search
    @q = ChgSpot.ransack(params[:q])
    @result = @q.result
    render :search
  end

  def search_details
    @chg_spot = ChgSpot.find(params[:id])
    render :search_details
  end

  def show
    @chg_spot = ChgSpot.find(params[:id])
  end
end
