set :application, 'tripclub'

set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'

# set :whenever_command, "bundle exec whenever"
# set :whenever_environment, defer { stage }
# require "whenever/capistrano"

set :rvm_type, :system

set :repository, 'https://github.com/alexeyfrank/tripclub.git'

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
# 
namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end

  # namespace :assets do
  #   desc "Local precompile assets and upload to server"
  #   task :precompile, roles: :app do
  #     run_locally "RAILS_ENV=#{rails_env} #{rake} assets:clean && RAILS_ENV=#{rails_env} #{rake} assets:precompile"
  #     run_locally "cd public && tar -jcf assets.tar.bz2 assets"
  #     top.upload "public/assets.tar.bz2", "#{shared_path}", via: :scp
  #     run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
  #     run_locally "rm public/assets.tar.bz2"
  #     run_locally "#{rake} assets:clean"
  #   end

  #   desc "Symlink local precompile assets"
  #   task :symlink, roles: :app do
  #     run "rm -rf #{latest_release}/public/assets &&
  #           mkdir -p #{latest_release}/public &&
  #           mkdir -p #{shared_path}/assets &&
  #           ln -s #{shared_path}/assets #{latest_release}/public/assets"
  #   end
  # end
end

namespace :log do
  desc "Watch tailf env log"
  task :tailf do
    stream("tailf /u/apps/#{application}/current/log/#{rails_env}.log")
  end
end


before 'deploy:finalize_update', 'deploy:symlink_db'
before 'deploy:finalize_update', 'deploy:assets:symlink'
after 'deploy:update_code', 'deploy:assets:precompile'
after "deploy:update", "deploy:cleanup"
after 'deploy:restart', 'puma:stop'
