set :stage, :production

role :app, "62.76.184.163"
role :web, "62.76.184.163"
role :db,  "62.76.184.163", primary: true

set :rails_env, "production"
set :user, 'tripclub_production'
set :branch, 'master'

# set :whenever_command, "bundle exec whenever"
# require "whenever/capistrano"
