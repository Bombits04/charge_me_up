class CommentsController < ApplicationController
  def create
    @chg_spot = ChgSpot.find(params[:chg_spot_id])

    @comment = @chg_spot.comments.create(comment_params)
    @comment.chg_spot_id = @chg_spot.id
    @comment.user_id = 1

    @comment.save

    redirect_to chg_spot_path(@chg_spot)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
