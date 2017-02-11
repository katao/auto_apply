
set :application, 'auto_apply'
set :repo_url, 'git@github.com:katao/auto_apply.git'

set :deploy_to, '/var/www/app/'

set :branch, ENV['BRANCH'] || 'master'

set :pty, false
set :scm, :git

set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip

append :linked_files, '.env', 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets'

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, -> { :worker }

#set :default_env, { path: "$HOME/.nodebrew/current/bin:$PATH" }

set :keep_releases, 5
set :ssh_options, port: "ssh"

#after 'deploy:updating', 'deploy:change_server_domain'
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end
end
