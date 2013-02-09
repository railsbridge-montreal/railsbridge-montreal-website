CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/upload"
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => 'motioneleven',
    :rackspace_api_key  => '129b90f992e5799e7d4db0126daefb48'
  }
  config.fog_directory = Rails.application.class.to_s.split("::").first.downcase
  config.asset_host = 'http://96facbb5976a796654a6-a65f9fdf8ef742cf41b738a37b9300f8.r80.cf2.rackcdn.com'
end