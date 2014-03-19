class Notifier < ActionMailer::Base
  default to: "info@railsbridge-montreal.com"

  def new_message message
    @message = message
    mail(
      from: @message.email,
      subject: "New Message on railsbridge-montreal.com"
    )
  end

  def new_registration registrant
    @registrant = registrant
    mail(
      from: @registrant.email,
      subject: "New registration on railsbridge-montreal.com"
    )
  end

end
