class MessagesController < ApplicationController

  respond_to :js

  def create
    @message = Message.new(message_params)
    if @message.save
      Notifier.new_message(@message).deliver
    end
    render layout: false
  end

  private

  def message_params
    params.require(:message).permit(:email, :message)
  end
end
