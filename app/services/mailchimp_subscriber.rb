class MailchimpSubscriber
  def initialize(registrant)
    @registrant = registrant
  end

  def call
    return unless ENV['MAILCHIMP_KEY'] && ENV['MAILCHIMP_LISTID']
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_KEY'])
    @gibbon.lists(ENV['MAILCHIMP_LISTID']).members.create(subscriber_params)
  rescue Gibbon::MailChimpError => error
    # lets just ignore them for now
    logger = Logger.new(STDOUT)
    logger.error error
  end

  private

  def subscriber_params
    {
      body: {
        email_address: @registrant.email,
        status: "subscribed",
        double_option: false,
        update_existing: true,
        interests: Hash[ENV['MAILCHIMP_INTERESTID'], true],
        merge_fields: {
          MMERGE3: @registrant.name
        }
      }
    }
  end
end

