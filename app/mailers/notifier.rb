class Notifier < ActionMailer::Base

  include SendGrid

  default from: 'no-reply@railsbridge-montreal.com'

  def notify_sponsor(message)
    @message = message
    @message.subject = "#{@message.name} wants to sponsor RailsBridge!"
    mail(
     from: "#{@message.name} <#{@message.email}>",
     to: (Rails.env.development? ? 'mathieu@motioneleven.com' : 'mprovencher86@gmail.com'),
     cc: @message.email,
     subject: @message.subject)
  end

end