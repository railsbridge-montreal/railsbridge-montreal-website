require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'draper/test/rspec_integration'

  Capybara.javascript_driver = :webkit

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true

    config.include Devise::TestHelpers, :type => :controller
    config.include Devise::TestHelpers, :type => :helper
    # config.extend ControllerMacros, :type => :controller

    config.order = :random

  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
end