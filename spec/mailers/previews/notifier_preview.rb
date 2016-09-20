class NotifierPreview < ActionMailer::Preview
  def childcare
    registrant = Registrant.last
    Notifier.childcare(registrant)
  end

  def schedule
    registrant = Registrant.last
    Notifier.schedule(registrant)
  end
end
