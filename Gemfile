source :rubygems

gem 'rails', '3.2.11'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'
end

gem 'jquery-rails'
gem "slim-rails"
gem "devise"

gem 'georgia', git: 'git@git.motioneleven.com:georgia.git'
gem 'henry',   git: 'git@git.motioneleven.com:henry.git'

group :development do
  gem 'figaro', git: 'git@git.motioneleven.com:figaro.git'
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