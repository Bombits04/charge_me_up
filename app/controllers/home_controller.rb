class HomeController < ApplicationController
  def index
    @q = ChgSpot.ransack
  end
end
