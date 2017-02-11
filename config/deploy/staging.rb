set :stage, :staging
set :branch, 'master'
#set :branch, ENV['BRANCH'] || 'develop'
set :rails_env, 'staging'
set :migration_role, 'db'
set :whenever_environment, :staging

role :app, %w{admin@ik1-330-25062.vs.sakura.ne.jp}
role :web, %w{admin@ik1-330-25062.vs.sakura.ne.jp}
role :db,  %w{admin@ik1-330-25062.vs.sakura.ne.jp}

server 'ik1-330-25062.vs.sakura.ne.jp', user: 'admin', roles: %w{web app db}

set :ssh_options, {
    keys: [File.expand_path('/key/path/to/')],
    forward_agent: true,
    auth_methods: %w(publickey)
}
