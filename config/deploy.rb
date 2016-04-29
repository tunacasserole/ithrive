# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'bindit'
set :repo_url, 'git@github.com:tunacasserole/bindit.git'
set :stages, %w(development staging qa)
set :repository, "git@gitlab.optum.com:optum-cloud/messenger.git"
set :deploy_via, :copy
set :copy_exclude, %w(.git/* .svn/* .DS_Store _design)
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/bindit'
# Default value for :scm is :git
set :scm, :git
set :branch, "master"
set :user, "root"
# set :default_run_options[:pty] = true
server "159.203.45.45", :app, :web, :db, :primary => true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
