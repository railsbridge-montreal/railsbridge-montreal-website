require "bundler/capistrano"

server "XXX.XXX.XXX.XXX", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "railsbridge_montreal"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git://github.com/railsbridge-montreal/website.git"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

require 'figaro/recipes'