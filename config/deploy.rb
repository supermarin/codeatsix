load 'deploy/assets'

host = "codeatsix.infinum.hr"

set :application, "codeatsix.infinum.hr"
set :repository,  "git@github.com:neektza/codeatsix.git"
set :deploy_to, "/var/www/c/codeatsix.infinum.hr" 

set :scm, :git
set :user, "www-data"
set :use_sudo, false

set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

role :web, host
role :app, host 
role :db,  host, :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
