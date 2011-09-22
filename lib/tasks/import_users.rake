namespace :db do

  desc "load user data from csv"
  task :load_csv_data  => :environment do
    require 'csv'

    CSV.foreach("users.csv") do |row|
      User.create(
        :first_name => row[0],
        :last_name => row[1],
        :nickname => row[2],
        :netid => row[3],
        :program => row[4],
        :program_year => row[5],
        :undergrad_college => row[6],
        :class_year => row[7],
        :email => row[8],
        :role => row[9],
        :status => row[10],
        :position => row[11],
        :sid_number => row[12]      
      )
    end
  end
end
