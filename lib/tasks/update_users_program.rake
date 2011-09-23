namespace :db do

  desc "load user data from csv and replace replace data in the Database"
  task :update_users_program  => :environment do
    require 'csv'

    CSV.foreach("update.csv") do |row|
      user = User.find_by_netid(row[1])
      if(defined?(user) && user != nil)
	    user.update_attributes(
        :program => row[0]      
      )
      else
	f = File.open("log/update.error.log", 'a')
	f.write(row)
	f.write("\n")
      end	
    end
  end
end
