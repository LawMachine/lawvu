
set :domain, "50.116.56.223"
#set :domain, "127.0.0.1"
server "#{domain}", :app, :web, :db, :primary => true
set :app_uri, 'lawvu.com'
set :deploy_to, "/var/www/#{app_uri}"
