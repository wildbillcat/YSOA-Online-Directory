default_run_options[:pty] = true 
set :application, "students"
set :repository,  "git@github.com:offmango/YSOA-Online-Directory.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/data/app"

server "ruby.architecture.yale.edu", :app, :web, :db, :primary => true

set :user, "admin"

set :scm_passphrase, "firstsaywhatyouwouldbe"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'

        require './config/boot'
        require 'hoptoad_notifier/capistrano'
