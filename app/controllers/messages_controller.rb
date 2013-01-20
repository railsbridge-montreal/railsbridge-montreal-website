class MessagesController < ApplicationController

  def create
    @message = Georgia::Message.new(params[:message])
    if @message.save
      Notifier.notify_info(@message).deliver
    end
    render layout: false
  end

end