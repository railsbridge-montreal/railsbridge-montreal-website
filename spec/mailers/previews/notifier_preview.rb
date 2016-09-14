class NotifierPreview < ActionMailer::Preview
  def childcare
    registrant = Registrant.last
    Notifier.childcare(registrant)
  end
end
