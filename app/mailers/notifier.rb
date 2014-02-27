class Notifier < ActionMailer::Base
  default to: "railsbridgemontreal@gmail.com"

  def new_message message
    @message = message
    mail(
      from: @message.email,
      subject: "New Message on railsbridge-montreal.com"
    )
  end

end
