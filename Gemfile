source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'
gem 'unicorn'
gem 'sendgrid'
gem 'airbrake'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'
end

gem 'jquery-rails'
gem "slim-rails"
gem "devise"
gem 'snippetize'

# Block both where they were. This site can easily be static anyway. Only one or two people end up fiddling with it.
# Suggestion: CMS could be taken out
gem 'georgia', git: 'git@git.motioneleven.com:motioneleven/georgia.git', ref: '1cfcfaf'
gem 'henry',   git: 'git@git.motioneleven.com:motioneleven/henry.git', ref: '3c3941f'

group :development do
  gem 'figaro', git: 'git@git.motioneleven.com:motioneleven/figaro.git'
  gem 'thin'
  gem 'debugger'
end

group :test do
  gem "debugger"
  gem "rspec-rails"
  gem 'shoulda-matchers'
  gem "factory_girl_rails"
  gem "capybara"
  gem 'capybara-webkit'
  gem 'spork'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-inotify' #for guard-rspec output
  gem 'libnotify' #for guard-rspec output
end