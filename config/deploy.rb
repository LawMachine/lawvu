# config valid only for Capistrano 3.1
lock '3.2.1'
invoke :production

set :application, 'lawvu'
set :repo_url, 'git@github.com:LawMachine/lawvu.git'
server '50.116.56.223', user: 'root', port: 22 , roles: %w{web app db}#,  ssh_options: {keys: %w{~/.ssh/id_rsa}, forward_agent: true, auth_methods: %w(publickey)}
set :stages, ["production"]
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
 set :deploy_to, '/var/www/lawvu'

# Default value for :scm is :git
 set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
 set :log_level, :debug

# Default value for :pty is false
 set :pty, true

# Default value for :linked_files is []
 set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
 set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
 set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
 set :keep_releases, 5

#before 'deploy', 'rvm:install:gems' 

namespace :deploy do

  
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
       execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
         #execute :rake, 'cache:clear'
      # end
    end
  end

end






# # config valid only for Capistrano 3.1
# lock '3.2.1'
# invoke :production
# set :application, 'lawvu'
# set :repo_url, 'git@github.com:LawMachine/lawvu.git'
# server '50.116.56.223', user: 'root', port: 22 , roles: %w{web app db}#,  ssh_options: {keys: %w{~/.ssh/id_rsa}, forward_agent: true, auth_methods: %w(publickey)}
# set :stages, ["production"]
# # Default branch is :master
# # ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# # Default deploy_to directory is /var/www/my_app
#  set :deploy_to, '/var/www/lawvu'

# # Default value for :scm is :git
#  set :scm, :git

# # Default value for :format is :pretty
# # set :format, :prettyf1.8

# # Default value for :log_level is :debug
#  set :log_level, :debug

# # Default value for :pty is false
#  set :pty, true

# # Default value for :linked_files is []
#  set :linked_files, %w{config/database.yml}

# # Default value for linked_dirs is []
#  set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# # Default value for default_env is {}
#  set :default_env, { path: "/opt/ruby/bin:$PATH" }

# # Default value for keep_releases is 5
#  set :keep_releases, 5

# namespace :deploy do

  
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#        execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#          #execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end
