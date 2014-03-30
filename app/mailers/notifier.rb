class Notifier < ActionMailer::Base
  default to: "info@railsbridge-montreal.com"
  layout 'layouts/email'

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

  def edit_registration registrant
    @registrant = registrant
    mail(
      from: 'admin@railsbridge-montreal.com',
      to: @registrant.email,
      subject: 'RailsBridge Montreal: questionnaire de classement / placement questionnaire'
    )
  end

  def confirmation_reminder registrant
    @registrant = registrant
    @locale = @registrant.language == 'french' ? 'fr' : 'en'
    I18n.with_locale(@locale) do |locale|
      mail(
          from: 'admin@railsbridge-montreal.com',
          to: @registrant.email,
          subject: t('.title'),
      )
    end
  end

end
