class MessagesController < ApplicationController

  def create
    @message = Message.new(params[:message])
    if @message.save
      Notifier.notify_sponsor(@message).deliver
    end
    render layout: false
  end

end