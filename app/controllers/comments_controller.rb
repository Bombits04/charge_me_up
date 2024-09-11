class CommentsController < ApplicationController
  before_action :set_chg_spot

  def create
    @comment = @chg_spot.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to chg_spot_path(@chg_spot), notice: "Comment was successfully created."
    else
      redirect_to chg_spot_path(@chg_spot), alert: "Failed to create comment."
    end
  end

  private

  def set_chg_spot
    @chg_spot = ChgSpot.find(params[:chg_spot_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
