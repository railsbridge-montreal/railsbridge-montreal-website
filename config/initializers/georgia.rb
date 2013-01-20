Georgia.setup do |config|
  # Add various page templates to fit your application needs
  # config.templates = %w(one-column sidebar-left sidebar-right)
  config.templates = %w(one-column contact)

  # Site title
  # config.title = Rails.application.class.to_s.split("::").first.downcase
  config.title = 'RailsBridge Montreal'

  # Site URL
  # Do not add trailing slash
  # config.url = 'http://www.example.com'
end