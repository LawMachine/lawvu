# server "my_fancy_server.com", :app, :web, :db, :primary => true
# set :deploy_to, "/var/www/fancy_shoes"
set :domain, "50.116.56.223"
server "#{domain}", :app, :web, :db, :primary => true
set :app_uri, 'lawvu.com'
set :deploy_to, "/var/www/#{app_uri}"
