Airbrake.configure do |config|
  config.api_key = '22574c110dac355010a7c20561c8e57b'
  config.host    = 'errors.motioneleven.com'
  config.port    = 80
  config.secure  = config.port == 443
end