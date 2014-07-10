class MessagesController < ApplicationController
  respond_to :html

  def new
    @message = Message.new
  end

  def create
    @message = Message.create message_params.merge(is_draft: is_draft?)
    flash[:notice] = 'Message was created' if @message.persisted?
    respond_with(@message, location: new_message_url)
  end

  private

  def is_draft?
    'Save as draft' == params[:commit]
  end

  def message_params
    params.require(:message).permit(:to_email, :subject, :body, :attachment)
  end
end
