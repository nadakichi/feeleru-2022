class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @business = Business.find(params[:business_id])
    if @comment.save
      CommentChannel.broadcast_to @business, { comment: @comment, user: @comment.user }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, business_id: params[:business_id])
  end
end
