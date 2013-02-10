require "bundler/capistrano"

server "50.57.140.29", :web, :app, :db, primary: true

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

namespace :email do
  desc "Symlink the email.credentials.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/email.credentials.yml #{release_path}/config/email.credentials.yml"
  end
  after "deploy:finalize_update", "email:symlink"
end