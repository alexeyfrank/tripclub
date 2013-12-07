set :application, 'tripclub'

set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'

# set :whenever_command, "bundle exec whenever"
# set :whenever_environment, defer { stage }
# require "whenever/capistrano"

set :repository, 'git@github.com:alexeyfrank/tripclub.git'

set :deploy_to, '/u/apps/tripclub'
# set :scm, :git

# set :rollbar_token, 'b2830920d9414ebf85a8674c04ede042'
set :use_sudo, false
set :ssh_options, forward_agent: true
set :rake, "#{rake} --trace"

default_run_options[:pty] = true

set :keep_releases, 5

# namespace :deploy do
#   desc "Symlinks the database.yml"
#   task :symlink_db, roles: :app do
#     run "ln -nfs #{release_path}/config/database.sample.yml #{release_path}/config/database.yml"
#   end
# end
# 
# before 'deploy:finalize_update', 'deploy:symlink_db'
