class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    Message.create message_params
    render nothing: true
  end

  private

  def message_params
    params.require(:message).permit(:to_email, :subject, :body, :attachment, :is_draft)
  end
end
