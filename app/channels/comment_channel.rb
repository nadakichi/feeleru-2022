class CommentChannel < ApplicationCable::Channel
  def subscribed
    @business = Business.find(params[:business_id])
    stream_for @business
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
