CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/upload"
  config.fog_credentials = {
    :provider           => YAML.load_file("#{Rails.root}/config/rackspace.credentials.yml")['provider'],
    :rackspace_username => YAML.load_file("#{Rails.root}/config/rackspace.credentials.yml")['username'],
    :rackspace_api_key => YAML.load_file("#{Rails.root}/config/rackspace.credentials.yml")['api_key'],
    :rackspace_servicenet => Rails.env.production?
  }
  config.fog_directory = YAML.load_file("#{Rails.root}/config/rackspace.credentials.yml")['fog_directory']
  config.asset_host = YAML.load_file("#{Rails.root}/config/rackspace.credentials.yml")['asset_host']
end