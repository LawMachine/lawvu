# set :application, "set your application name here"
# set :repository,  "set your repository location here"

# set :scm, :subversion
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end




#require 'rvm/capistrano'
require 'bundler/capistrano'
# require 'capistrano/ext/multistage'

set :domain, "50.116.56.223"
server "#{domain}", :app, :web, :db, :primary => true
set :application, "lawvu"
#set :repository,  "https://github.com/audiorokit/audio_rokit.git"
#set :repository,  "https://nerdix@bitbucket.org/nerdix/idify_site.git"
set :repository, "git@github.com:LawMachine/lawvu"

set :use_sudo, false

set :scm, :git
set :branch, "master"
set :user, "root"
set :app_uri, 'lawvu.com'
set :deploy_to, "/var/www/#{app_uri}"

set :deploy_via, :copy
#set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

 set :stages, ["development", "staging", "production"]
 #set :default_stage, "production"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:cleanup"

after "deploy:cleanup", "deploy:fix_permissions"

# On initial deploy uncomment all the before 'deploy:assets:precompile' callbacks:

# if you want to create the database on each deploy uncomment this:
before 'deploy:assets:precompile', "deploy:db:create"

# if you want to migrate the database on each deploy uncomment this:
before 'deploy:assets:precompile', "deploy:db:migrate"

# if you want to seed the database on each deploy uncomment this:
before 'deploy:assets:precompile', "deploy:db:seed"

namespace :deploy do
  # task :start do ; end
  # task :stop do ; end
  # task :restart, :roles => :app, :except => { :no_release => true } do
  #   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  # end
  
  desc "Fix Permissions"
  task :fix_permissions, :roles => :app do
  	puts "\n\n=== Fixing the Permissions! ===\n\n"
  	run "cd #{latest_release} && sudo chmod -R 755 app/"
    run "cd #{latest_release} && sudo chmod -R 755 config/"
    run "cd #{latest_release} && sudo chmod -R 777 public/"
    run "cd #{latest_release} && sudo chmod -R 777 tmp/"
  end

  namespace :db do
  	desc "Create Database"
    task :create do
      puts "\n\n=== Creating the Database! ===\n\n"
      run "cd #{release_path} && bundle exec rake db:create RAILS_ENV=#{rails_env}"
    end
  
    desc "Migrate Database"
    task :migrate do
      puts "\n\n=== Migrating the Database! ===\n\n"
      run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
    end

    desc "Populates the Database"
    task :seed do
      puts "\n\n=== Populating the Database! ===\n\n"
      run "cd #{release_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
    end
  end
end
