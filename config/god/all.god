RAILS_ENV     	= ENV['RAILS_ENV'] = 'production'
RAILS_ROOT    	= ENV['RAILS_ROOT'] = '/var/data/app/current'
BIN_PATH		= "/usr/local/rvm/gems/ruby-1.9.2-p180/bin"
God.log_file  	= "#{RAILS_ROOT}/log/god.log"
God.log_level 	= :info

%w(redis resque).each do |config|
  God.load "#{RAILS_ROOT}/config/god/#{config}.god"
end